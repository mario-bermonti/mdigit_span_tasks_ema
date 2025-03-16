import 'package:device_info_plus/device_info_plus.dart';
import 'package:mdigit_span_tasks_ema/src/core/device/device_os.dart';
import 'package:mdigit_span_tasks_ema/src/core/device/get_os.dart' as get_os;

/// Utility object that provides metadata about the user's device.
///
/// It is basically a wrapper around other packages/objects. Only supports
/// android and ios.
class Device {
  /// Object provided by [device_info_plus] to access device metadata.
  ///
  /// A default object is provided, but can be overridden for flexibility.
  final DeviceInfoPlugin _deviceInfo;

  /// Function for getting the current os.
  ///
  /// A default function is provided [get_os.getOS], but can be overridden for
  /// flexibility.
  final OS Function() _getOS;

  Device({
    DeviceInfoPlugin? deviceInfo,
    OS Function() getOS = get_os.getOS,
  })  : _deviceInfo = deviceInfo ?? DeviceInfoPlugin(),
        _getOS = getOS;

  Future<String> get model async {
    if (_getOS() == OS.android) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.model;
    } else {
      final IosDeviceInfo iosDeviceInfo = await _deviceInfo.iosInfo;
      return iosDeviceInfo.model;
    }
  }

  OS get os {
    return _getOS();
  }
}
