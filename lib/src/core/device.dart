import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class Device {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  final String platform = Platform.
  Device() {
    _deviceInfo.androidInfo;
  }
  Future<String> model() async {
    final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
    androidInfo.version;
  }
}
