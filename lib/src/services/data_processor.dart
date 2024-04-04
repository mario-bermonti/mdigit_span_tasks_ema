import 'package:digit_span_tasks/digit_span_tasks.dart';

import '../data_manager/data_manager.dart';

/// Process data from a cognitive task's single session and save it to the db
Future<void> processData({
  required String participantID,
  required String sessionID,
  required String taskName,
  required DigitSpanTaskData data,
}) async {
  DataManager dataManager = DataManager(
    participantID: participantID,
    sessionID: sessionID,
    taskName: taskName,
  );
  await dataManager.initDB(name: taskName);
  dataManager.addDevice(device: data.device);
  dataManager.addSession(session: data.session);
  dataManager.addTrials(trials: data.trials);
}
