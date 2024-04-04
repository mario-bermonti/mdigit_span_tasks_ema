import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DataExporter {
  final String taskName;
  late final File db;
  late final String dbPath;
  late final File destinationFile;

  DataExporter({required this.taskName});

  /// Request storage permission
  Future<void> requestPermission() async {
    if (Platform.isAndroid) {
      bool granted = await Permission.storage.request().isGranted;
      if (!granted) {
        throw Exception(
            "Exporting error: Permission not granted to save data.");
      }
    }
  }

  /// Get db from disk so it can be copied
  /// It assumes the db is in the [getApplicationDocumentsDirectory] dir
  /// with the name [taskName]. This method does not modify the original db.
  Future<void> getDB() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    dbPath = "${dir.path}/$taskName";
    db = File(dbPath);
  }

  /// Get destination file on which to save the db copy.
  /// The destination file will be in the `Download` folder and will have the
  /// same name as the dbs.
  /// Currently only android is supported.
  Future<void> initDestinationFile() async {
    Directory destinationDir = await _initDestinationDir();
    final String destinationPath = '${destinationDir.path}/$taskName';
    destinationFile = File(destinationPath);
  }

  /// Gets the directory to which the db will be exported.
  /// Currently only android is supported and the destination dir is a
  /// directory named `mDigitSpanTasks` in the android `Download` folder.
  /// It creates the directory with its parent dirs if these do not exist.
  Future<Directory> _initDestinationDir() async {
    Directory downloadsDir =
        Directory('/storage/emulated/0/Download/mDigitSpanTasks');
    await downloadsDir.create(recursive: true);

    return downloadsDir;
  }

  /// Create copy of db in the path specified by [destinationFile].
  /// Does not alter the original db.
  Future<void> copyDB() async {
    await db.copy(destinationFile.path);
  }
}
