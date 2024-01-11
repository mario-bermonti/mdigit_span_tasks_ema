import 'package:cognitive_data/data.dart';

import '../data_manager/data_manager.dart';

/// Process data from a single session and save it to the db
Future<void> processData({
  required String participantID,
  required String sessionID,
  required dynamic data,
  required String dbName,
  required TrialType trialType,
}) async {
  DataManager dataManager = DataManager(
    participantID: participantID,
    sessionID: sessionID,
    data: data,
  );

  await dataManager.initDB(name: dbName);
  dataManager.addDeviceData();
  dataManager.addSessionMetaData();
  dataManager.addTrialData(trialType: trialType);

  await dataManager.saveDataDB();
}
