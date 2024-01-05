import 'package:cognitive_data/data.dart';
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

  /// Helper method that adds the necessary device data to db
  void addDeviceData() {
    _dataBase.addDeviceData(
      participantId: participantID,
      sessionID: sessionID,
    );
  }

  /// Helper method that adds the necessary session metadata to db
  void addSessionMetaData() {
    _dataBase.addSessionMetaData(
      participantId: participantID,
      sessionID: sessionID,
      timeStart: data.sessionData.startTime,
      timeEnd: data.sessionData.endTime,
    );
  }

  /// Adds the data from all trials to db
  /// TODO specify type
  void addTrialData({required TrialType trialType}) {
    for (var trial in data.trialData) {
      _dataBase.addTrialData(
        participantId: participantID,
        stim: trial.stim,
        resp: trial.response,
        trialType: trialType,
        sessionID: sessionID,
      );
    }
  }

  Future<void> saveDataDB() async {
    await _dataBase.saveData();
  }
}
