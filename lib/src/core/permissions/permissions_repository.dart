import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigits/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigits/src/core/ema_db/permissions/permission_repository.dart'
    as ema_db;

/// Service that handles the permissions metadata.
///
/// It wraps the [ema_db] data repository to manage the metadata.
class PermissionRepository {
  final ema_db.PermissionRepository _permissionRepository;
  final String _participantId;

  PermissionRepository({
    required ema_db.PermissionRepository permissionRepository,
    required String participantId,
  })  : _permissionRepository = permissionRepository,
        _participantId = participantId;

  /// Initializes the service with all its dependencies.
  PermissionRepository.init({
    required String participantId,
  })  : _permissionRepository = ema_db.PermissionRepository(
          remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
          localDataSource: GetxDataSource(db: GetStorage()),
        ),
        _participantId = participantId;

  /// Save permission to the remote and local dbs.
  Future<void> save({required Permission permission}) async {
    final String pathRemoteDB =
        'permissions/$_participantId/${permission.permissionId}';
    String pathLocalDB = '${permission.permissionId}Permission';

    await _permissionRepository.save(
      permission: permission,
      pathRemoteDB: pathRemoteDB,
      pathLocalDB: pathLocalDB,
    );
  }

  /// Fetches the latest permission data for the [permissionId] from dbs.
  Future<Permission?> getLatest({required String permissionId}) async {
    final String pathRemoteDB = 'permissions/$_participantId/$permissionId';
    String pathLocalDB = '${permissionId}Permission';

    final Permission? permission = await _permissionRepository.getLatest(
      pathRemoteDB: pathRemoteDB,
      pathLocalDB: pathLocalDB,
    );

    return permission;
  }

  /// Saves permission to the db if the status has changed since the most recent.
  ///
  /// The permission is saved to the db if there is no permission in the db
  /// because it is treated as having changed.
  Future<void> saveIfChanged({required Permission permission}) async {
    final String pathRemoteDB =
        'permissions/$_participantId/${permission.permissionId}';
    String pathLocalDB = '${permission.permissionId}Permission';

    await _permissionRepository.saveIfChanged(
      permission: permission,
      pathRemoteDB: pathRemoteDB,
      pathLocalDB: pathLocalDB,
    );
  }
}
