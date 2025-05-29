import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigits/src/core/ema_db/notifications/models/notification.dart';

/// Provides a simple interface for managing [Notification] metadata.
class NotificationRepository {
  final RemoteDataSource _remoteDataSource;

  NotificationRepository({
    required RemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  /// Saves [notification] to the remote database.
  ///
  /// [pathRemoteDB] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  Future<void> save({
    required Notification notification,
    required String pathRemoteDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: notification,
      path: pathRemoteDB,
    );
  }
}
