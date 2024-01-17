import 'dart:io';

import 'package:cognitive_data/errors.dart';
import 'package:permission_handler/permission_handler.dart';

class DataExporter {
  /// Request permissions
  Future<void> requestPermission() async {
    if (Platform.isAndroid) {
      bool granted = await Permission.storage.request().isGranted;
      if (!granted) {
        throw PermissionNotGrantedException();
      }
    }
  }
}
