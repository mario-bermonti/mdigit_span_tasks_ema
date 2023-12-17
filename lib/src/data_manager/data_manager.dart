import 'package:digit_span_tasks/digit_span_tasks.dart';

class DataManager {
  final String participantID;

  /// TODO add type
  final data;
  late final String sessionID;

  DataManager({
    required this.participantID,
    required this.data,
  });

  void createSessionID() {
    sessionID =
        participantID + data.practiceData.sessionData.startTime.toString();
    print(sessionID);
  }
}
