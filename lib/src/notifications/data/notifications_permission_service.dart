import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/permission_repository.dart';

/// Service that handles the permissions metadata.
///
/// It wraps the data repository to manage the metadata.
class NotificationsPermissionService {
  final PermissionRepository _permissionRepository;

  NotificationsPermissionService(
      {required PermissionRepository permissionRepository})
      : _permissionRepository = permissionRepository;

  /// Convenience method that initializes the service with all its dependencies.
  ///
  /// It serves as an informal named constructor.
  static NotificationsPermissionService init() {
    final FirebaseDataSource firebaseDataSource =
        FirebaseDataSource(db: FirebaseFirestore.instance);
    final GetxDataSource getxDataSource = GetxDataSource(db: GetStorage());
    final PermissionRepository permissionRepository = PermissionRepository(
      remoteDataSource: firebaseDataSource,
      localDataSource: getxDataSource,
    );

    return NotificationsPermissionService(
        permissionRepository: permissionRepository);
  }
}
