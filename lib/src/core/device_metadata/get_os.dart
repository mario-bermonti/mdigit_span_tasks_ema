import 'dart:io';

import 'package:mdigit_span_tasks_ema/src/core/device_metadata/device_os.dart';

/// Returns the device's OS.
///
/// Only supports android and ios. Throws an exception for other platforms.
OS getOS() {
  if (Platform.isAndroid) {
    return OS.android;
  } else if (Platform.isIOS) {
    return OS.ios;
  } else {
    throw Exception(
        "Device platform not supported. Only Android and iOS are supported.");
  }
}
