import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigits/src/core/ema_db/device/models/device.dart';

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

  /// Fetches all [Device] from the database.
  ///
  /// [pathRemoteDB] must be a valid path that can be used to create a collection.
  Future<List<Device>?> get({required String pathRemoteDB}) async {
    final List<Map<String, dynamic>>? devicesJson =
        await _remoteDataSource.getDataModels(path: pathRemoteDB);

    if (devicesJson == null) return null;

    final List<Device> devices =
        devicesJson.map((device) => Device.fromJson(device)).toList();
    return devices;
  }
}
