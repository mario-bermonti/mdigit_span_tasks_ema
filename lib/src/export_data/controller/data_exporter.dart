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
  /// Gets the directory to which the db will be exported.
  /// Currently only android is supported and the destionation dir is a
  /// directory named 'mDigitSpanTasks' in the android external storage.
  /// It creates the directory with its parent dirs if these do not exist.
  Future<Directory> _getDestionationDir() async {
    Directory? externalDir = await getExternalStorageDirectory();

    /// TODO handle errors that will arise if [externalDir] is null
    Directory dsExternalDir = Directory('${externalDir!.path}/mDigitSpanTasks');
    dsExternalDir.create(recursive: true);

    return dsExternalDir;
  }
}
