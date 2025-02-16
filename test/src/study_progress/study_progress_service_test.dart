import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/progress_repository.dart';
import 'package:mdigit_span_tasks_ema/src/study_progress/study_progress_service.dart';

import 'study_progress_test_cases.dart';

void main() {
  late FakeFirebaseFirestore remoteDB;
  late FirebaseDataSource remoteDataSource;
  late GetStorage localDB;
  late GetxDataSource localDataSource;
  late StudyProgressService studyProgressService;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      remoteDB = FakeFirebaseFirestore();
      remoteDataSource = FirebaseDataSource(db: remoteDB);
      localDB = GetStorage();
      localDataSource = GetxDataSource(db: localDB);
      final ProgressRepository progressStudyRepository = ProgressRepository(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
      );
      studyProgressService =
          StudyProgressService(progressRepository: progressStudyRepository);
    },
  );
  tearDown(() async {
    await remoteDB.clearPersistence();
    await localDB.erase();
  });
  group("StudyProgressService.save", () {
    test(
      "Given a [progressStep], saves it to remote db in "
      "'progress/{progressStep.participantId}/steps/{progressStep.stepId}'",
      () async {
        await studyProgressService.save(progressStep: testProgressStep);

        final DocumentSnapshot<
            Map<String,
                dynamic>> progressSnapshot = await remoteDB
            .doc(
                'progress/${testProgressStep.participantId}/steps/${testProgressStep.stepId}')
            .get();

        final ProgressStep actualProgressStep =
            ProgressStep.fromJson(progressSnapshot.data()!);

        expect(
          actualProgressStep,
          testProgressStep,
        );
      },
    );
    test(
      "Given a [progressStep], saves it to local db in '{progressStep.stepId}'",
      () async {
        await studyProgressService.save(progressStep: testProgressStep);

        final Map<String, dynamic> actualProgress =
            await localDB.read(testProgressStep.stepId);

        final ProgressStep actualProgressStep =
            ProgressStep.fromJson(actualProgress);

        expect(
          actualProgressStep,
          testProgressStep,
        );
      },
    );
  });
}
