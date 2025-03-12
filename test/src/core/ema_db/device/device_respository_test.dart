import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/device/device_respository.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/device/models/device.dart';

import '../../../ema_db/test_data/device.dart';

void main() {
  late FirebaseDataSource firebaseDataSource;
  late DeviceRepository repository;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
      repository = DeviceRepository(
        remoteDataSource: firebaseDataSource,
      );
    },
  );
  tearDown(() async {
    await firebaseDataSource.db.clearPersistence();
  });
  group('DeviceRepository.save', () {
    test(
      "Given a [Device], [pathRemoteDB], saves the data to the remote db.",
      () async {
        await repository.save(
          device: testDevice,
          pathRemoteDB: testPathRemoteDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await firebaseDataSource.db.collection(testPathRemoteDB).get();
        final Device actualDevice = Device.fromJson(snapshot.docs.first.data());

        expect(actualDevice, testDevice);
      },
    );
  });
}
