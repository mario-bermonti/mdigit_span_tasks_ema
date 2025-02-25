import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/progress_repository.dart';

/// Service that handles the study progress.
///
/// It wraps the progress repository to manage the data.
class StudyProgressService {
  final ProgressRepository _progressRepository;

  StudyProgressService({required ProgressRepository progressRepository})
      : _progressRepository = progressRepository;

  static StudyProgressService init() {
    final ProgressRepository progressRepository = ProgressRepository(
      remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
      localDataSource: GetxDataSource(db: GetStorage()),
    );
    return StudyProgressService(progressRepository: progressRepository);
  }

  /// Saves the progress step to the local and remote databases.
  Future<void> save({required ProgressStep progressStep}) async {
    await _progressRepository.save(
      progressStep: progressStep,
      pathRemoteDB:
          'progress/${progressStep.participantId}/steps/${progressStep.stepId}',
      pathLocalDB: progressStep.stepId,
    );
  }

  /// Get a specific progress step from the database.
  Future<ProgressStep?> get({
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
    ProgressStep? firstAppLaunch = await get(
      participantId: participantId,
      stepId: 'firstAppLaunch',
    );
    if (firstAppLaunch != null) return;

    final DateTime now = DateTime.now();
    firstAppLaunch = ProgressStep(
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
