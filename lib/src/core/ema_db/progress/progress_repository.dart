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
}
