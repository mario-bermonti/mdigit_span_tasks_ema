import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/core/device_metadata/device_metadata.dart';
import 'package:mdigits/src/core/device_metadata/device_os.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/device/device_respository.dart';
import 'package:mdigits/src/core/ema_db/device/models/device.dart';
import 'package:mdigits/src/device/device_service.dart';

import 'test_cases.dart';

void main() {
  late FirebaseDataSource firebaseDataSource;
  late DeviceRepository deviceRepository;
  late DeviceService deviceService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
    deviceRepository = DeviceRepository(remoteDataSource: firebaseDataSource);

    MockDeviceInfoPlugin mockDeviceInfoPlugin = MockDeviceInfoPlugin(
      androidDeviceInfo: MockAndroidDevice(),
      iosDeviceInfo: MockIosDevice(),
    );

    final DeviceMetadata device = DeviceMetadata(
      deviceInfo: mockDeviceInfoPlugin,
      getOS: () => OS.android,
    );

    deviceService = DeviceService(
      participantId: participantId,
      device: device,
      deviceRepository: deviceRepository,
    );
  });

  tearDown(() async {
    await firebaseDataSource.db.clearPersistence();
  });

  group(
    'DeviceService.saveData',
    () {
      test(
        "Saves the data with participantId `testParticipant` to the remote db "
        "in 'devices/participants/$participantId'.",
        () async {
          await deviceService.saveData();

          final QuerySnapshot<Map<String, dynamic>> snapshot =
              await firebaseDataSource.db.collection(testPathRemote).get();
          final Device actualDevice =
              Device.fromJson(snapshot.docs.first.data());

          expect(actualDevice.participantId, participantId);
        },
      );
    },
  );
}
