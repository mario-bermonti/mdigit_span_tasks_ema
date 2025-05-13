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
  group('NotificationsPermissionRepositoryService.updateIfNecessary', () {
    test(
      "Given that there are no previous permissions in remote db, does nothing.",
      () async {
        await service.updateIfNecessary(areAccepted: false);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        expect(snapshot.docs.isEmpty, true);
      },
    );
    test(
      "Given that the new and the permission in remote db are both accepted, "
      "does nothing",
      () async {
        await remoteDB
            .collection(testPathRemoteDB)
            .add(testAcceptedPermission.toJson());

        await service.updateIfNecessary(areAccepted: true);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        expect(snapshot.docs.length, 1);
      },
    );
    test(
      "Given that the new and the permission in remote db are both denied, "
      "does nothing",
      () async {
        await remoteDB
            .collection(testPathRemoteDB)
            .add(testDeniedPermission.toJson());

        await service.updateIfNecessary(areAccepted: false);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();

        expect(snapshot.docs.length, 1);
      },
    );
    test(
      "Given that permissions have changed in remote db, "
      "save the new permission object to db.",
      () async {
        await remoteDB
            .collection(testPathRemoteDB)
            .add(testAcceptedPermission.toJson());

        await service.updateIfNecessary(areAccepted: false);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();

        expect(snapshot.docs.length, 2);
      },
    );
    test(
      "Given that there are no previous permissions in local db, does nothing.",
      () async {
        await service.updateIfNecessary(areAccepted: false);

        final Map<String, dynamic>? actualPermission =
            localDB.read(testPathLocalDB);
        expect(actualPermission, null);
      },
    );
    test(
      "Given that permissions have not changed in local db, "
      "does nothing and keeps on being only one permission in db.",
      () async {
        await localDB.write(testPathLocalDB, testAcceptedPermission.toJson());

        await service.updateIfNecessary(areAccepted: true);

        final Map<String, dynamic>? actualPermission =
            localDB.read(testPathLocalDB);
        expect(actualPermission, testAcceptedPermission.toJson());
      },
    );
    test(
      "Given that permissions have changed in local db, "
      "save the new permission object to db.",
      () async {
        await localDB.write(testPathLocalDB, testAcceptedPermission.toJson());

        await service.updateIfNecessary(areAccepted: false);

        final Map<String, dynamic> actualPermission =
            localDB.read(testPathLocalDB);

        expect(actualPermission, isNot(testAcceptedPermission.toJson()));
      },
    );
  });
}
