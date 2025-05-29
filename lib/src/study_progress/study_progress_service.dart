import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/core/ema_db/progress/progress_repository.dart';

/// Service that handles the study progress.
///
/// It wraps the progress repository to manage the data.
class StudyProgressService {
  final StudyProgressRepository _progressRepository;

  StudyProgressService({required StudyProgressRepository progressRepository})
      : _progressRepository = progressRepository;

  static StudyProgressService init() {
    final StudyProgressRepository progressRepository = StudyProgressRepository(
      remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
      localDataSource: GetxDataSource(db: GetStorage()),
    );
    return StudyProgressService(progressRepository: progressRepository);
  }

  /// Saves the progress step to the local and remote databases.
  Future<void> save({required StudyProgressStep progressStep}) async {
    await _progressRepository.save(
      progressStep: progressStep,
      pathRemoteDB:
          'progress/${progressStep.participantId}/steps/${progressStep.stepId}',
      pathLocalDB: progressStep.stepId,
    );
  }

  /// Get a specific progress step from the database.
  Future<StudyProgressStep?> get({
    required String participantId,
    required String stepId,
  }) async {
    return await _progressRepository.get(
      pathRemoteDB: 'progress/$participantId/steps/$stepId',
      pathLocalDB: stepId,
    );
  }

  /// Save the first app launch progress step.
  Future<void> saveFirstAppLaunch({required String participantId}) async {
    StudyProgressStep? firstAppLaunch = await get(
      participantId: participantId,
      stepId: 'firstAppLaunch',
    );
    if (firstAppLaunch != null) return;

    final DateTime now = DateTime.now();
    firstAppLaunch = StudyProgressStep(
      participantId: participantId,
      stepId: 'firstAppLaunch',
      stepDescription: "First app launch",
      status: Status.completed,
      completionDateTime: now,
      lastUpdatedDateTime: now,
    );
    save(progressStep: firstAppLaunch);
  }
}
