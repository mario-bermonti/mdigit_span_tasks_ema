import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cognitive_data/cognitive_data.dart';
import 'package:cognitive_data/databases/firebase_db/firebase_db.dart';

class DataManager {
  late final FirebaseDB _db;
  final String participantID;
  final String sessionID;
  final String taskName;

  DataManager({
    required this.participantID,
    required this.sessionID,
    required this.taskName,
  }) {
    _db = FirebaseDB(
      FirebaseFirestore.instance,
      participantID: participantID,
      sessionID: sessionID,
      taskName: taskName,
    );
  }

  /// Adds [Device] metadata to db
  void addDevice({required Device device}) {
    _db.addDevice(device: device);
  }

  /// Adds [Session] metadata to db
  void addSession({required Session session}) {
    _db.addSession(session: session);
  }

  /// Adds a list of [Trial]s to the db
  void addTrials({required List<Trial> trials}) {
    _db.addTrials(trials: trials);
  }
}
