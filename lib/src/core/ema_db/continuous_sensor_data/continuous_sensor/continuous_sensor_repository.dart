import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';

/// Provides a simple interface for managing [ContinuousSensor] data.
///
/// Continuous sensor data is typically produced by the device's sensors.
class ContinuousSensorRepository {
  final RemoteDataSource _remoteDataSource;

  ContinuousSensorRepository({
    required RemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  /// Saves [ContinuousSensorModel] to the remote database.
  ///
  /// [pathRemoteDB] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  Future<void> save({
    required ContinuousSensorModel continuousSensorData,
    required String pathRemoteDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: continuousSensorData,
      path: pathRemoteDB,
    );
  }
}
