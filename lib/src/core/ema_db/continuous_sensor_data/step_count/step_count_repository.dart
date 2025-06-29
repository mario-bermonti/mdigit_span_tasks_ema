import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/step_count/models/step_count_model.dart';

/// Provides a simple interface for managing [StepCount] data.
class StepCountRepository {
  final RemoteDataSource _remoteDataSource;

  StepCountRepository({
    required RemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  /// Saves [stepCount] to the remote database.
  ///
  /// [pathRemoteDB] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  Future<void> save({
    required StepCountModel stepCount,
    required String pathRemoteDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: stepCount,
      path: pathRemoteDB,
    );
  }
}
