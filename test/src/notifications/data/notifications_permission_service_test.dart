import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/permission_repository.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/data/notifications_permission_service.dart';

import 'test_cases.dart';

void main() {
  late FakeFirebaseFirestore remoteDB;
  late GetStorage localDB;
  late NotificationsPermissionService service;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    remoteDB = FakeFirebaseFirestore();
    localDB = GetStorage();
    final PermissionRepository permissionRepository = PermissionRepository(
      remoteDataSource: FirebaseDataSource(db: remoteDB),
      localDataSource: GetxDataSource(db: localDB),
    );

    service = NotificationsPermissionService(
      permissionRepository: permissionRepository,
      participantId: testPermission.participantId,
    );
  });

  tearDown(() {
    remoteDB.clearPersistence();
    localDB.erase();
  });

  group('NotificationsPermissionService.save', () {
    test(
      "Saves a permission with correct data to the remote db.",
      () async {
        await service.save();

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        final Permission actualPermission =
            Permission.fromJson(snapshot.docs.first.data());

        expect(actualPermission.participantId, testPermission.participantId);
        expect(actualPermission.permissionId, testPermission.permissionId);
        expect(actualPermission.status, testPermission.status);
        expect(actualPermission.permissionDescription,
            testPermission.permissionDescription);
      },
    );
    test(
      "Saves a permission with correct data to the local db.",
      () async {
        await service.save();

        final Map<String, dynamic> permissionJson =
            localDB.read(testPathLocalDB);
        final Permission actualPermission = Permission.fromJson(permissionJson);

        expect(actualPermission.participantId, testPermission.participantId);
        expect(actualPermission.permissionId, testPermission.permissionId);
        expect(actualPermission.status, testPermission.status);
        expect(actualPermission.permissionDescription,
            testPermission.permissionDescription);
      },
    );
  });
  group('NotificationsPermissionService.getLatest', () {
    test(
      "Returns valid permission if it only exists in remote.",
      () async {
        remoteDB.collection(testPathRemoteDB).add(testPermission.toJson());

        final Permission? actualPermission = await service.getLatest();

        expect(actualPermission?.participantId, testPermission.participantId);
        expect(actualPermission?.permissionId, testPermission.permissionId);
        expect(actualPermission?.status, testPermission.status);
        expect(actualPermission?.permissionDescription,
            testPermission.permissionDescription);
      },
    );
    test(
      "Returns valid permission if it only exists in local.",
      () async {
        await localDB.write(testPathLocalDB, testPermission.toJson());

        final Permission? actualPermission = await service.getLatest();

        expect(actualPermission?.participantId, testPermission.participantId);
        expect(actualPermission?.permissionId, testPermission.permissionId);
        expect(actualPermission?.status, testPermission.status);
        expect(actualPermission?.permissionDescription,
            testPermission.permissionDescription);
      },
    );
  });
}
