import 'package:cognitive_data/cognitive_data.dart';
import 'package:path_provider/path_provider.dart';

class DataManager {
  late final DriftDB _dataBase;

  /// Initialize a Database named [name] in the
  /// [getApplicationDocumentsDirectory].
  ///
  /// The db is private and can only be accessed through the [DataManager]'s.
  Future<void> initDB({required String name}) async {
    final dir = await getApplicationDocumentsDirectory();
    final String dbPath = "${dir.path}/$name.sqlite3";

    _dataBase = DriftDB.init(path: dbPath);
  }

  /// Adds [Device] metadata to db
  void addDevice({required Device device}) {
    _dataBase.addDevice(device: device);
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

  /// Adds a list of [Trial]s to the db
  void addTrials({required List<Trial> trials}) {
    _dataBase.addTrials(trials: trials);
  }

  /// Save session metadata, device and trial data to db
  Future<void> saveDataDB() async {
    await _dataBase.saveData();
  }
}
