import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/permission_repository.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/data/notifications_permission_repository_service.dart';

import 'notifications_permission_repo_test_cases.dart';

void main() {
  late FakeFirebaseFirestore remoteDB;
  late GetStorage localDB;
  late NotificationsPermissionRepositoryService service;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    remoteDB = FakeFirebaseFirestore();
    localDB = GetStorage();
    final PermissionRepository permissionRepository = PermissionRepository(
      remoteDataSource: FirebaseDataSource(db: remoteDB),
      localDataSource: GetxDataSource(db: localDB),
    );

    service = NotificationsPermissionRepositoryService(
      permissionRepository: permissionRepository,
      participantId: testAcceptedPermission.participantId,
    );
  });

  tearDown(() {
    remoteDB.clearPersistence();
    localDB.erase();
  });

  group('NotificationsPermissionService.save', () {
    test(
      "Saves an accepted permission with correct data to the remote db.",
      () async {
        await service.save(areAccepted: true);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        final Permission actualPermission =
            Permission.fromJson(snapshot.docs.first.data());

        expect(actualPermission.participantId,
            testAcceptedPermission.participantId);
        expect(
            actualPermission.permissionId, testAcceptedPermission.permissionId);
        expect(actualPermission.status, testAcceptedPermission.status);
        expect(actualPermission.permissionDescription,
            testAcceptedPermission.permissionDescription);
      },
    );
    test(
      "Saves an accepted permission with correct data to the local db.",
      () async {
        await service.save(areAccepted: true);

        final Map<String, dynamic> permissionJson =
            localDB.read(testPathLocalDB);
        final Permission actualPermission = Permission.fromJson(permissionJson);

        expect(actualPermission.participantId,
            testAcceptedPermission.participantId);
        expect(
            actualPermission.permissionId, testAcceptedPermission.permissionId);
        expect(actualPermission.status, testAcceptedPermission.status);
        expect(actualPermission.permissionDescription,
            testAcceptedPermission.permissionDescription);
      },
    );
    test(
      "Saves a denied permission with correct data to the remote db.",
      () async {
        await service.save(areAccepted: false);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        final Permission actualPermission =
            Permission.fromJson(snapshot.docs.first.data());

        expect(
            actualPermission.participantId, testDeniedPermission.participantId);
        expect(
            actualPermission.permissionId, testDeniedPermission.permissionId);
        expect(actualPermission.status, testDeniedPermission.status);
        expect(actualPermission.permissionDescription,
            testDeniedPermission.permissionDescription);
      },
    );
  });
  group('NotificationsPermissionService.getLatest', () {
    test(
      "Returns valid permission if it only exists in remote.",
      () async {
        remoteDB
            .collection(testPathRemoteDB)
            .add(testAcceptedPermission.toJson());

        final Permission? actualPermission = await service.getLatest();

        expect(actualPermission?.participantId,
            testAcceptedPermission.participantId);
        expect(actualPermission?.permissionId,
            testAcceptedPermission.permissionId);
        expect(actualPermission?.status, testAcceptedPermission.status);
        expect(actualPermission?.permissionDescription,
            testAcceptedPermission.permissionDescription);
      },
    );
    test(
      "Returns valid permission if it only exists in local.",
      () async {
        await localDB.write(testPathLocalDB, testAcceptedPermission.toJson());

        final Permission? actualPermission = await service.getLatest();

        expect(actualPermission?.participantId,
            testAcceptedPermission.participantId);
        expect(actualPermission?.permissionId,
            testAcceptedPermission.permissionId);
        expect(actualPermission?.status, testAcceptedPermission.status);
        expect(actualPermission?.permissionDescription,
            testAcceptedPermission.permissionDescription);
      },
    );
  });
}
