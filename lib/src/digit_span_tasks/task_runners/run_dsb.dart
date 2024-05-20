import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import '../config/config_dsb.dart';
import '../prep_data.dart';

/// Configure and start the DSB
Future<DigitSpanTaskData> runDigitSpanBackwards({
  required String participantID,
  required String sessionID,
}) async {
  DigitSpanTask task;
  final DSBConfig dsbConfig = DSBConfig();
  final UserConfig userConfigPractice = UserConfig(
    stimList: dsbConfig.practiceStim,
    participantID: participantID,
    sessionID: sessionID,
    sessionType: SessionType.practice,
  );

  task = DigitSpanTask(
    config: userConfigPractice,
  );
  DigitSpanTaskData practiceData = await task.run();

  final UserConfig userConfigExperimental = UserConfig(
    stimList: dsbConfig.experimentalStim,
    participantID: participantID,
    sessionID: sessionID,
    sessionType: SessionType.experimental,
  );

  task = DigitSpanTask(
    config: userConfigExperimental,
  );
  DigitSpanTaskData experimentalData = await task.run();

  final DigitSpanTaskData data = prepData(
    practiceData: practiceData,
    experimentalData: experimentalData,
  );

  return data;
}
