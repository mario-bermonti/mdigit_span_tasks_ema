import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigits/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigits/src/core/permissions/permissions_repository.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigits/src/core/ema_db/permissions/permission_repository.dart'
    as ema_db;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../ema_db/fake_path_provider.dart';
import 'permissions_repo_test_cases.dart';

void main() {
  late FakeFirebaseFirestore remoteDB;
  late GetStorage localDB;
  late PermissionRepository repo;
  // late PermissionsRepository repo;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProviderPlatform();
    await GetStorage.init();
    localDB = GetStorage();

    remoteDB = FakeFirebaseFirestore();
    final ema_db.PermissionRepository permissionRepository =
        ema_db.PermissionRepository(
      remoteDataSource: FirebaseDataSource(db: remoteDB),
      localDataSource: GetxDataSource(db: localDB),
    );

    repo = PermissionRepository(
        permissionRepository: permissionRepository,
        participantId: testAcceptedPermission.participantId);
  });

  tearDown(() {
    remoteDB.clearPersistence();
    localDB.erase();
  });

  group('PermissionsRepository.save', () {
    test(
      "Saves an accepted permission with correct data to the remote db.",
      () async {
        await repo.save(permission: testAcceptedPermission);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        final Permission actualPermission =
            Permission.fromJson(snapshot.docs.first.data());

        expect(actualPermission, testAcceptedPermission);
      },
    );
    test(
      "Saves an accepted permission with correct data to the local db.",
      () async {
        await repo.save(permission: testAcceptedPermission);

        final Map<String, dynamic> permissionJson =
            localDB.read(testPathLocalDB);
        final Permission actualPermission = Permission.fromJson(permissionJson);

        expect(actualPermission, testAcceptedPermission);
      },
    );
  });
  group('PermissionsRepository.getLatest', () {
    test(
      "Returns valid permission if it only exists in remote.",
      () async {
        remoteDB
            .collection(testPathRemoteDB)
            .add(testAcceptedPermission.toJson());

        final Permission? actualPermission = await repo.getLatest(
            permissionId: testAcceptedPermission.permissionId);

        expect(actualPermission, testAcceptedPermission);
      },
    );
    test(
      "Returns valid permission if it only exists in local.",
      () async {
        await localDB.write(testPathLocalDB, testAcceptedPermission.toJson());

        final Permission? actualPermission = await repo.getLatest(
            permissionId: testAcceptedPermission.permissionId);

        expect(actualPermission, testAcceptedPermission);
      },
    );
  });
  group('PermissionsRepository.updateIfNecessary', () {
    test(
      "Given that there are no previous permissions in remote db, save new "
      "permission to db.",
      () async {
        await repo.saveIfChanged(permission: testAcceptedPermission);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        expect(snapshot.docs.length, 1);
      },
    );
    test(
      "Given that the new and the permission in remote db are both accepted, "
      "does nothing.",
      () async {
        await remoteDB
            .collection(testPathRemoteDB)
            .add(testAcceptedPermission.toJson());

        await repo.saveIfChanged(permission: testAcceptedPermission);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        expect(snapshot.docs.length, 1);
      },
    );
    test(
      "Given that the new and the permission in remote db are both denied, "
      "does nothing.",
      () async {
        await remoteDB
            .collection(testPathRemoteDB)
            .add(testDeniedPermission.toJson());

        await repo.saveIfChanged(permission: testDeniedPermission);

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

        await repo.saveIfChanged(permission: testDeniedPermission);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();

        expect(snapshot.docs.length, 2);
      },
    );
    test(
      "Given that there are no previous permissions in local db, save new "
      "permission to db.",
      () async {
        await repo.saveIfChanged(permission: testAcceptedPermission);

        final Map<String, dynamic> actualPermission =
            localDB.read(testPathLocalDB);
        expect(Permission.fromJson(actualPermission), testAcceptedPermission);
      },
    );
    test(
      "Given that permissions have not changed in local db, "
      "does nothing and keeps on being only one permission in db.",
      () async {
        await localDB.write(testPathLocalDB, testAcceptedPermission.toJson());

        await repo.saveIfChanged(permission: testAcceptedPermission);

        final Map<String, dynamic> actualPermission =
            localDB.read(testPathLocalDB);
        expect(Permission.fromJson(actualPermission), testAcceptedPermission);
      },
    );
    test(
      "Given that permissions have changed in local db, "
      "save the new permission object to db.",
      () async {
        await localDB.write(testPathLocalDB, testAcceptedPermission.toJson());

        await repo.saveIfChanged(permission: testDeniedPermission);

        final Map<String, dynamic> actualPermission =
            localDB.read(testPathLocalDB);

        expect(Permission.fromJson(actualPermission),
            isNot(testAcceptedPermission));
      },
    );
  });
}
