import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/progress_repository.dart';

import '../../../ema_db/test_data/progress.dart';

class MockRemoteDataSource extends Fake implements RemoteDataSource {
  @override
  Future<Map<String, dynamic>?> getDataModel({required String path}) {
    return Future.value(null);
  }

  @override
  Future<void> updateEMAModel(
      {required EMAModel emaModel, required String path}) {
    return Future.value();
  }
}

void main() {
  late FirebaseDataSource firebaseDataSource;
  late GetStorage getStorage;
  late GetxDataSource getxDataSource;
  late StudyProgressRepository repository;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
      getStorage = GetStorage();
      getxDataSource = GetxDataSource(db: getStorage);

      repository = StudyProgressRepository(
        remoteDataSource: firebaseDataSource,
        localDataSource: getxDataSource,
      );
    },
  );
  tearDown(() async {
    await firebaseDataSource.db.clearPersistence();
    await getStorage.erase();
  });

  group('ProgressRepository.save', () {
    test(
      "Given a [ProgressStep], [pathRemoteDB], [pathLocalDB], saves the data to "
      "remote db.",
      () async {
        await repository.save(
          progressStep: testProgressStep,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final DocumentSnapshot<Map<String, dynamic>> progressStepSnapshot =
            await firebaseDataSource.db.doc(testPathRemoteDB).get();
        final Map<String, dynamic>? actualProgressStepJson =
            progressStepSnapshot.data();

        final StudyProgressStep? actualProgressStep =
            actualProgressStepJson != null
                ? StudyProgressStep.fromJson(actualProgressStepJson)
                : null;

        expect(
          actualProgressStep,
          testProgressStep,
        );
      },
    );
    test(
      "Given a [ProgressStep], [pathRemoteDB], [pathLocalDB], saves the data to "
      "local db.",
      () async {
        await repository.save(
          progressStep: testProgressStep,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Map<String, dynamic>? actualProgressStepJson =
            getxDataSource.db.read(testPathLocalDB);

        final StudyProgressStep? actualProgressStep =
            actualProgressStepJson != null
                ? StudyProgressStep.fromJson(actualProgressStepJson)
                : null;

        expect(
          actualProgressStep,
          testProgressStep,
        );
      },
    );
    test(
      "Given a [ProgressStep], [pathRemoteDB], [pathLocalDB], overrides "
      "data in local db.",
      () async {
        await getxDataSource.db
            .write(testPathLocalDB, testProgressStepIncomplete.toJson());

        await repository.save(
          progressStep: testProgressStep,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Map<String, dynamic>? actualProgressStepJson =
            getxDataSource.db.read(testPathLocalDB);

        final StudyProgressStep? actualProgressStep =
            actualProgressStepJson != null
                ? StudyProgressStep.fromJson(actualProgressStepJson)
                : null;

        expect(
          actualProgressStep,
          testProgressStep,
        );
      },
    );
    test(
      "Given a [ProgressStep], [pathRemoteDB], [pathLocalDB], does not "
      "override data in local db if remote data is null.",
      () async {
        getxDataSource.db
            .write(testPathLocalDB, testProgressStepIncomplete.toJson());

        final StudyProgressRepository mockedRepository =
            StudyProgressRepository(
          remoteDataSource: MockRemoteDataSource(),
          localDataSource: getxDataSource,
        );

        await mockedRepository.save(
          progressStep: testProgressStep,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Map<String, dynamic>? actualProgressStepJson =
            getxDataSource.db.read(testPathLocalDB);

        final StudyProgressStep? actualProgressStep =
            actualProgressStepJson != null
                ? StudyProgressStep.fromJson(actualProgressStepJson)
                : null;

        expect(actualProgressStep, testProgressStepIncomplete);
      },
    );
  });
  group(
    'ProgressRepository.get',
    () {
      test(
        "Given a [pathRemoteDB] and [pathLocalDB], loads the data from remote db.",
        () async {
          await firebaseDataSource.db
              .doc(testPathRemoteDB)
              .set(testProgressStepJson);

          final StudyProgressStep? actualProgressStep = await repository.get(
            pathRemoteDB: testPathRemoteDB,
            pathLocalDB: testPathLocalDB,
          );

          expect(actualProgressStep, testProgressStep);
        },
      );
      test(
        "Given a [pathRemoteDB] and [pathLocalDB], loads the data from local db "
        "if remote data is null.",
        () async {
          await getxDataSource.db
              .write(testPathLocalDB, testProgressStep.toJson());

          final StudyProgressRepository mockedRepository =
              StudyProgressRepository(
            remoteDataSource: MockRemoteDataSource(),
            localDataSource: getxDataSource,
          );

          final StudyProgressStep? actualProgressStep =
              await mockedRepository.get(
            pathRemoteDB: testPathRemoteDB,
            pathLocalDB: testPathLocalDB,
          );

          expect(actualProgressStep, testProgressStep);
        },
      );
      test(
        "Given a [pathRemoteDB] and [pathLocalDB], updates local data from remote db.",
        () async {
          await firebaseDataSource.db
              .doc(testPathRemoteDB)
              .set(testProgressStepJson);

          await repository.get(
              pathRemoteDB: testPathRemoteDB, pathLocalDB: testPathLocalDB);

          final Map<String, dynamic> actualProgressStep =
              await getxDataSource.db.read(testPathLocalDB);

          expect(
              testProgressStep, StudyProgressStep.fromJson(actualProgressStep));
        },
      );
      test(
        "Given a [pathRemoteDB] and [pathLocalDB], returns null if remote and "
        "local data are null.",
        () async {
          final StudyProgressStep? actualProgressStep = await repository.get(
            pathRemoteDB: testPathRemoteDB,
            pathLocalDB: testPathLocalDB,
          );
          expect(actualProgressStep, null);
        },
      );
    },
  );
}
