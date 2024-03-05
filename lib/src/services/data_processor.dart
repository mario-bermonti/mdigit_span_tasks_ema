import 'package:digit_span_tasks/digit_span_tasks.dart';

import '../data_manager/data_manager.dart';

/// Process data from a single session and save it to the db
Future<void> processData({
  required String dbName,
  required DigitSpanTaskData data,
}) async {
  DataManager dataManager = DataManager();
  await dataManager.initDB(name: dbName);
  dataManager.addDevice(device: data.device);
  dataManager.addSession(session: data.session);
  dataManager.addTrials(trials: data.trials);
}
