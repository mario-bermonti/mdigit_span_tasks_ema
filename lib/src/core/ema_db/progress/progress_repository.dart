import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/local_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/progress_step.dart';

/// Provides a simple interface for managing participant's progress in the study.
class ProgressRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  ProgressRepository({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  /// Saves [progressStep] to the remote and local databases.
  /// Overrides the data for fields present in [progressStep].
  Future<void> save({
    required ProgressStep progressStep,
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
    final ProgressStep updatedProgressStep =
        ProgressStep.fromJson(updatedProgressStepJson);

    await _localDataSource.saveEMAModel(
      emaModel: updatedProgressStep,
      path: pathLocalDB,
    );
  }

  /// Fetches the participant progress step from the database.
  ///
  /// It will try the remote db first and update the local data with the remote
  /// data. It will fall back to the local db if the remote db is not available.
  Future<ProgressStep?> get({
    required String pathRemoteDB,
    required String pathLocalDB,
  }) async {
    Map<String, dynamic>? progressStepJson =
        await _remoteDataSource.getDataModel(path: pathRemoteDB);

    if (progressStepJson != null) {
      final ProgressStep progressStep = ProgressStep.fromJson(progressStepJson);
      await _localDataSource.saveEMAModel(
          emaModel: progressStep, path: pathLocalDB);
      return progressStep;
    }

    progressStepJson = await _localDataSource.getDataModel(path: pathLocalDB);
    if (progressStepJson == null) return null;
    return ProgressStep.fromJson(progressStepJson);
  }
}
