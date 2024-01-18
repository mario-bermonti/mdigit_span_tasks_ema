import 'dart:io';

import 'package:cognitive_data/errors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DataExporter {
  final String dbName;
  late final File db;
  late final String dbPath;

  DataExporter({required this.dbName});

  /// Request storage permission
  Future<void> requestPermission() async {
    if (Platform.isAndroid) {
      bool granted = await Permission.storage.request().isGranted;
      if (!granted) {
        throw PermissionNotGrantedException();
      }
    }
  }

  /// Get db from disk so it can be copied
  /// It assumes the db is in the [getApplicationDocumentsDirectory] dir
  /// with the name [dbName]. This method does not modify the original db.
  Future<void> getDB() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    dbPath = "${dir.path}/$dbName.sqlite3";
    db = File(dbPath);
  }
}
