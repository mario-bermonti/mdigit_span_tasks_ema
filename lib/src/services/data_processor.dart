import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import '../digit_span_tasks/config/config.dart';
import '../data_manager/data_manager.dart';

/// Process data from a cognitive task's single session and save it to the db
Future<void> processData({
  required DigitSpanTaskData data,
}) async {
  final DigitSpanTaskConfig config = Get.find();
  DataManager dataManager = DataManager(
    participantID: config.participantID,
    sessionID: config.sessionID,
    taskName: config.taskName,
  );
  await dataManager.addDevice(device: data.device);
  await dataManager.addSession(session: data.session);
  await dataManager.addTrials(trials: data.trials);
}
