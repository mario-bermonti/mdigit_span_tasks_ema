import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigits/src/core/ema_db/pedestrian_status/models/pedestrian_status_model.dart';

/// Provides a simple interface for managing [PedestrianStatus] data.
class PedestrianStatusRepository {
  final RemoteDataSource _remoteDataSource;

  PedestrianStatusRepository({
    required RemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  /// Saves [pedestrianStatus] to the remote database.
  ///
  /// [pathRemoteDB] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  Future<void> save({
    required PedestrianStatusModel pedestrianStatus,
    required String pathRemoteDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: pedestrianStatus,
      path: pathRemoteDB,
    );
  }
}
