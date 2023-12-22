import 'package:cognitive_data/data.dart';
import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:path_provider/path_provider.dart';

class DataManager {
  final String participantID;
  final String sessionID;
  late final DataBase _dataBase;

  /// TODO add type
  final data;

  DataManager({
    required this.participantID,
    required this.sessionID,
    required this.data,
  });

  Future<void> initDB({required String name}) async {
    final dir = await getApplicationDocumentsDirectory();
    final String dbPath = "${dir.path}/$name.sqlite3";

    _dataBase = DataBase(path: dbPath);
  }
}
