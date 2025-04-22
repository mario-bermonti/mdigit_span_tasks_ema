import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/permission_repository.dart';

/// Service that handles the permissions metadata.
///
/// It wraps the data repository to manage the metadata.
class NotificationsPermissionRepositoryService {
  final PermissionRepository _permissionRepository;
  final String permissionId = 'notifications';
  final String _participantId;

  NotificationsPermissionRepositoryService({
    required PermissionRepository permissionRepository,
    required String participantId,
  })  : _permissionRepository = permissionRepository,
        _participantId = participantId;

  /// Convenience method that initializes the service with all its dependencies.
  ///
  /// It serves as an informal named constructor.
  static NotificationsPermissionRepositoryService init({
    required String participantId,
  }) {
    final FirebaseDataSource firebaseDataSource =
        FirebaseDataSource(db: FirebaseFirestore.instance);
    final GetxDataSource getxDataSource = GetxDataSource(db: GetStorage());
    final PermissionRepository permissionRepository = PermissionRepository(
      remoteDataSource: firebaseDataSource,
      localDataSource: getxDataSource,
    );

    return NotificationsPermissionRepositoryService(
      permissionRepository: permissionRepository,
      participantId: participantId,
    );
  }

  /// Save notifications permission to the remote and local dbs.
  ///
  /// Converts `areAccepted` to the appropriate status.
  Future<void> save({required bool areAccepted}) async {
    final Status status = areAccepted ? Status.accepted : Status.denied;
    final Permission permission = Permission(
      participantId: _participantId,
      permissionId: permissionId,
      permissionDescription: 'Notifications permission',
      dateTimeChanged: DateTime.now(),
      status: status,
    );

    final String pathRemoteDB =
        'permissions/$_participantId/${permission.permissionId}';
    const String pathLocalDB = 'notificationsPermissions';

    await _permissionRepository.save(
      permission: permission,
      pathRemoteDB: pathRemoteDB,
      pathLocalDB: pathLocalDB,
    );
  }

  /// Fetches the latest notifications permission from dbs.
  Future<Permission?> getLatest() async {
    final String pathRemoteDB = 'permissions/$_participantId/$permissionId';
    const String pathLocalDB = 'notificationsPermissions';

    final Permission? permission = await _permissionRepository.getLatest(
      pathRemoteDB: pathRemoteDB,
      pathLocalDB: pathLocalDB,
    );

    return permission;
  }
}
