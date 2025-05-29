import 'package:mdigits/src/core/ema_db/datasources/local_datasource.dart';
import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigits/src/core/ema_db/permissions/models/permission.dart';

/// Provides a simple interface for managing [Permission] metadata.
class PermissionRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  PermissionRepository({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  /// Saves [permission] to the remote and local databases.
  ///
  /// [pathRemoteDB] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  Future<void> save({
    required Permission permission,
    required String pathRemoteDB,
    required String pathLocalDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: permission,
      path: pathRemoteDB,
    );

    await _localDataSource.saveEMAModel(
      emaModel: permission,
      path: pathLocalDB,
    );
  }

  /// Fetches the permissions from the database.
  ///
  /// It will try the remote db first and will fall back to the local db if the
  /// remote db is not available.
  Future<List<Permission>?> get({
    required String pathRemoteDB,
    required String pathLocalDB,
  }) async {
    final List<Map<String, dynamic>>? remotePermissionsJson =
        await _remoteDataSource.getDataModels(path: pathRemoteDB);

    if (remotePermissionsJson != null) {
      final List<Permission> permissions = remotePermissionsJson
          .map((permission) => Permission.fromJson(permission))
          .toList();
      return permissions;
    }

    final Map<String, dynamic>? localPermissionsJson =
        await _localDataSource.getDataModel(path: pathLocalDB);
    if (localPermissionsJson == null) return null;

    final Permission localPermission =
        Permission.fromJson(localPermissionsJson);
    return <Permission>[localPermission];
  }

  /// Fetches the latest permission from the database.
  ///
  /// It will try the remote db first and will fall back to the local db if the
  /// remote db is not available.
  Future<Permission?> getLatest({
    required String pathRemoteDB,
    required String pathLocalDB,
  }) async {
    final List<Permission>? permissions = await get(
      pathRemoteDB: pathRemoteDB,
      pathLocalDB: pathLocalDB,
    );

    if (permissions == null || permissions.isEmpty) return null;
    permissions.sort((permission1, permission2) =>
        permission1.dateTimeChanged.compareTo(permission2.dateTimeChanged));
    return permissions.last;
  }
}
