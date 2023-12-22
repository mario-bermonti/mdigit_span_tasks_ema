import 'package:cognitive_data/data.dart';
import 'package:digit_span_tasks/digit_span_tasks.dart';

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
}
