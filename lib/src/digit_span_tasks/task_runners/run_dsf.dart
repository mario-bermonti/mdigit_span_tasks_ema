import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/instructions.dart';
import '../../ui_components/loading_screen.dart';
import '../config/config_dsf.dart';
import '../prep_data.dart';

/// Configure and start the DSF
Future<DigitSpanTaskData> runDigitSpanForward({
  required String participantID,
  required String sessionID,
}) async {
  Get.to(() => const LoadingScreen());
  DigitSpanTask task;
  final DSFConfig dsfConfig = DSFConfig();
  final UserConfig userConfigPractice = UserConfig(
    stimList: dsfConfig.practiceStim,
    participantID: participantID,
    sessionID: sessionID,
    sessionType: SessionType.practice,
  );

  task = DigitSpanTask(
    config: userConfigPractice,
  );
  DigitSpanTaskData practiceData = await task.run();

  await Get.to(() => const Instructions(text: '¡Terminamos esta actividad!'));

  final UserConfig userConfigExperimental = UserConfig(
    stimList: dsfConfig.experimentalStim,
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

  await Get.to(() => const Instructions(text: '¡Terminamos esta actividad!'));

  Get.toNamed('/');
  return data;
}
