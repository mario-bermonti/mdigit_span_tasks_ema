import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigits/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigits/src/core/ema_db/permissions/permission_repository.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../fake_path_provider.dart';
import 'test_cases.dart';

class MockRemoteDataSource extends Fake implements RemoteDataSource {
  @override
  Future<Map<String, dynamic>?> getDataModel({required String path}) {
    return Future.value(null);
  }
}

void main() {
  late PermissionRepository repository;
  late FirebaseFirestore remoteDB;
  late GetStorage localDB;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProviderPlatform();
    remoteDB = FakeFirebaseFirestore();
    FirebaseDataSource firebaseDataSource = FirebaseDataSource(db: remoteDB);

    await GetStorage.init();
    localDB = GetStorage();
    GetxDataSource getXDataSource = GetxDataSource(db: localDB);

    repository = PermissionRepository(
      remoteDataSource: firebaseDataSource,
      localDataSource: getXDataSource,
    );
  });

  tearDown(() {
    remoteDB.clearPersistence();
    localDB.erase();
  });

  group('PermissionRepository.save', () {
    test(
      "Given a [Permission], [pathRemoteDB], [pathLocalDB], saves the data to "
      "remote db.",
      () async {
        await repository.save(
          permission: testPermission,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();

        final Permission actualPermission =
            Permission.fromJson(snapshot.docs.first.data());

        expect(actualPermission, testPermission);
      },
    );
    test(
      "Given a [Permission], [pathRemoteDB], [pathLocalDB], saves the data to "
      "local db.",
      () async {
        await repository.save(
          permission: testPermission,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Map<String, dynamic> actualPermissionJson =
            localDB.read(testPathLocalDB);

        final Permission actualPermission =
            Permission.fromJson(actualPermissionJson);

        expect(actualPermission, testPermission);
      },
    );
  });
  group('PermissionRepository.get', () {
    test(
      "Given a [pathRemoteDB] and [pathLocalDB], returns the data from remote db.",
      () async {
        await remoteDB
            .collection(testPathRemoteDB)
            .doc()
            .set(testPermission.toJson());

        final List<Permission>? actualPermissions = await repository.get(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        expect(actualPermissions?.first, testPermission);
      },
    );
    test(
      "Given a [pathRemoteDB] and [pathLocalDB], returns the data from local db "
      "if remote data is null.",
      () async {
        await localDB.write(testPathLocalDB, testPermission.toJson());

        final List<Permission>? actualPermissions = await repository.get(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        expect(actualPermissions?.first, testPermission);
      },
    );
    test(
      "Given a [pathRemoteDB] and [pathLocalDB], returns null if both remote and "
      "local data are null.",
      () async {
        final List<Permission>? actualPermissions = await repository.get(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        expect(actualPermissions, null);
      },
    );
  });
  group('PermissionRepository.get', () {
    test(
      "Given a [pathRemoteDB] and [pathLocalDB], returns the latest remote data "
      "for the specified permission.",
      () async {
        await remoteDB
            .collection(testPathRemoteDB)
            .add(testPermission.toJson());
        await remoteDB
            .collection(testPathRemoteDB)
            .add(testPermission2.toJson());
        await remoteDB
            .collection(testPathRemoteDB)
            .add(testPermission3.toJson());

        final Permission? actualPermission = await repository.getLatest(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        expect(actualPermission, testPermission3);
      },
    );
    test(
      "Given a [pathRemoteDB] and [pathLocalDB], returns the latest local data "
      "for the specified permission, if remote data is null.",
      () async {
        await localDB.write(testPathLocalDB, testPermission3.toJson());

        final Permission? actualPermission = await repository.getLatest(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        expect(actualPermission, testPermission3);
      },
    );
  });
  group('PermissionsRepository.updateIfNecessary', () {
    test(
      "Given that there are no previous permissions in remote db, save new "
      "permission to db.",
      () async {
        await repository.saveIfChanged(
          permission: testPermission,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

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
            .add(testPermission.toJson());

        await repository.saveIfChanged(
          permission: testPermission,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

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

        await repository.saveIfChanged(
          permission: testDeniedPermission,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

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
            .add(testPermission.toJson());

        await repository.saveIfChanged(
          permission: testDeniedPermission,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();

        expect(snapshot.docs.length, 2);
      },
    );
    test(
      "Given that there are no previous permissions in local db, save new "
      "permission to db.",
      () async {
        await repository.saveIfChanged(
          permission: testPermission,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Map<String, dynamic> actualPermission =
            localDB.read(testPathLocalDB);
        expect(Permission.fromJson(actualPermission), testPermission);
      },
    );
    test(
      "Given that permissions have not changed in local db, "
      "does nothing and keeps on being only one permission in db.",
      () async {
        await localDB.write(testPathLocalDB, testPermission.toJson());

        await repository.saveIfChanged(
          permission: testPermission2,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Map<String, dynamic> actualPermission =
            localDB.read(testPathLocalDB);
        expect(Permission.fromJson(actualPermission), testPermission);
      },
    );
    test(
      "Given that permissions have changed in local db, "
      "save the new permission object to db.",
      () async {
        await localDB.write(testPathLocalDB, testPermission.toJson());

        await repository.saveIfChanged(
          permission: testDeniedPermission,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Map<String, dynamic> actualPermission =
            localDB.read(testPathLocalDB);

        expect(Permission.fromJson(actualPermission), isNot(testPermission));
      },
    );
  });
}
