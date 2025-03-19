import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/core/device_metadata/device_metadata.dart';
import 'package:mdigit_span_tasks_ema/src/core/device_metadata/device_os.dart';

import 'test_cases.dart';

void main() {
  group('Device.model', () {
    test(
      "Given an Android device, returns testAndroidModel.",
      () async {
        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.android,
        );

        expect(await device.model, MockAndroidDevice().model);
      },
    );
    test(
      "Given an ios device, returns testIosModel.",
      () async {
        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.ios,
        );

        expect(await device.model, MockIosDevice().model);
      },
    );
  });
  group('Device.os', () {
    test(
      "Given an Android device, returns OS.android.",
      () async {
        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.android,
        );

        expect(device.os, OS.android);
      },
    );
    test(
      "Given an ios device, returns OS.ios.",
      () async {
        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.ios,
        );

        expect(device.os, OS.ios);
      },
    );
  });
  group('Device.osVersion', () {
    test(
      "Given an Android device, returns testAndroidOSVersion.",
      () async {
        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.android,
        );

        expect(await device.osVersion, MockAndroidDevice().version.release);
      },
    );
    test(
      "Given an ios device, returns testIosOSVersion.",
      () async {
        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.ios,
        );

        expect(await device.osVersion, MockIosDevice().systemVersion);
      },
    );
  });
  group('Device.height', () {
    test(
      "Returns a double greater than 0.",
      () {
        TestWidgetsFlutterBinding.ensureInitialized();

        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.android,
        );

        expect(device.height, greaterThan(0));
      },
    );
  });
  group('Device.width', () {
    test(
      "Returns a double greater than 0.",
      () {
        TestWidgetsFlutterBinding.ensureInitialized();

        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.android,
        );

        expect(device.width, greaterThan(0));
      },
    );
  });
  group('Device.aspectRatio', () {
    test(
      "Returns a double greater than 0.",
      () {
        TestWidgetsFlutterBinding.ensureInitialized();

        final MockDeviceInfoPlugin deviceInfo = MockDeviceInfoPlugin(
          androidDeviceInfo: MockAndroidDevice(),
          iosDeviceInfo: MockIosDevice(),
        );

        final DeviceMetadata device = DeviceMetadata(
          deviceInfo: deviceInfo,
          getOS: () => OS.android,
        );

        expect(device.aspectRatio, greaterThan(0));
      },
    );
  });
}
