import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/device/models/device.dart';

/// Provides a simple interface for managing [Device] metadata.
class DeviceRepository {
  final RemoteDataSource _remoteDataSource;

  DeviceRepository({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  /// Saves [device] to the remote database
  ///
  /// [pathRemoteDB] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  Future<void> save({
    required Device device,
    required String pathRemoteDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: device,
      path: pathRemoteDB,
    );
  }
}
