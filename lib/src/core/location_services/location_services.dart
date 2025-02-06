import 'package:intl/intl.dart';

/// Utility class for getting location information.
class LocationService {
  String get locale => Intl.getCurrentLocale();

  /// Returns the timezone in the format "TimezoneName+OffsetInHours".
  /// It is based on the current time as defined by the device and not the
  /// location (GPS) of the device.
  String get timezone {
    final DateTime now = DateTime.now();
    return now.timeZoneName + now.timeZoneOffset.inHours.toString();
  }
}
