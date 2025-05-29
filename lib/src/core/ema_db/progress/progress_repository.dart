import 'package:mdigits/src/core/ema_db/datasources/local_datasource.dart';
import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';

/// Provides a simple interface for managing participant's progress in the study.
class StudyProgressRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  StudyProgressRepository({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  /// Saves [progressStep] to the remote and local databases.
  /// Overrides the data for fields present in [progressStep].
  Future<void> save({
    required StudyProgressStep progressStep,
    required String pathRemoteDB,
    required String pathLocalDB,
  }) async {
    await _remoteDataSource.updateEMAModel(
      emaModel: progressStep,
      path: pathRemoteDB,
    );

    final Map<String, dynamic>? updatedProgressStepJson =
        await _remoteDataSource.getDataModel(path: pathRemoteDB);

    if (updatedProgressStepJson == null) return;
    final StudyProgressStep updatedProgressStep =
        StudyProgressStep.fromJson(updatedProgressStepJson);

    await _localDataSource.saveEMAModel(
      emaModel: updatedProgressStep,
      path: pathLocalDB,
    );
  }

  /// Fetches the participant progress step from the database.
  ///
  /// It will try the remote db first and update the local data with the remote
  /// data. It will fall back to the local db if the remote db is not available.
  Future<StudyProgressStep?> get({
    required String pathRemoteDB,
    required String pathLocalDB,
  }) async {
    Map<String, dynamic>? progressStepJson =
        await _remoteDataSource.getDataModel(path: pathRemoteDB);

    if (progressStepJson != null) {
      final StudyProgressStep progressStep =
          StudyProgressStep.fromJson(progressStepJson);
      await _localDataSource.saveEMAModel(
          emaModel: progressStep, path: pathLocalDB);
      return progressStep;
    }

    progressStepJson = await _localDataSource.getDataModel(path: pathLocalDB);
    if (progressStepJson == null) return null;
    return StudyProgressStep.fromJson(progressStepJson);
  }
}
