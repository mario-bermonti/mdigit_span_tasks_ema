import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/step_count/models/step_count_model.dart';
import 'package:mdigits/src/core/ema_db/step_count/step_count_repository.dart';

import 'step_count_model_test_cases.dart';

void main() {
  late StepCountRepository repository;
  late FirebaseFirestore remoteDB;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    remoteDB = FakeFirebaseFirestore();
    FirebaseDataSource firebaseDataSource = FirebaseDataSource(db: remoteDB);

    repository = StepCountRepository(
      remoteDataSource: firebaseDataSource,
    );
  });

  tearDown(() {
    remoteDB.clearPersistence();
  });

  group('StepCountRepository.save', () {
    test(
      "Given a [StepCountModel], [pathRemoteDB], saves the data to the "
      "remote db.",
      () async {
        await repository.save(
          stepCount: testStepCountModel,
          pathRemoteDB: testPathRemoteDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();

        final StepCountModel actualStepCountModel =
            StepCountModel.fromJson(snapshot.docs.first.data());

        expect(actualStepCountModel, testStepCountModel);
      },
    );
    test(
      "Given a [StepCountModel], [pathRemoteDB], doesn't override previous data "
      "when saving the data to the remote db.",
      () async {
        await repository.save(
          stepCount: testStepCountModel,
          pathRemoteDB: testPathRemoteDB,
        );

        await repository.save(
          stepCount: testStepCountModel,
          pathRemoteDB: testPathRemoteDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();

        expect(snapshot.docs.length, 2);
      },
    );
  });
}
