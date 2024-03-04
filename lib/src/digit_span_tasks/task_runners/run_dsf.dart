import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import '../config/config_dsf.dart';

Future<DigitSpanTasksData> runDigitSpanForward({
  required String participantID,
  required String sessionID,
}) async {
  final DSFConfig dsfConfig = DSFConfig();
  final UserConfig userConfig = UserConfig(
      stimListPractice: dsfConfig.practiceStim,
      stimListExperimental: dsfConfig.experimentalStim,
      participantID: participantID,
      sessionID: sessionID);

  DigitSpanTasksData data = await Get.to(() => DigitSpanForward(
        config: userConfig,
      ));

  return data;
}
