import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import '../config/config_dsf.dart';

/// Configure and start the DSF
Future<DigitSpanTaskData> runDigitSpanForward({
  required String participantID,
  required String sessionID,
}) async {
  final DSFConfig dsfConfig = DSFConfig();
  final UserConfig userConfig = UserConfig(
      stimListPractice: dsfConfig.practiceStim,
      stimListExperimental: dsfConfig.experimentalStim,
      participantID: participantID,
      sessionID: sessionID);

  DigitSpanTaskData data = await Get.to(() => DigitSpanForward(
        config: userConfig,
      ));

  return data;
}
