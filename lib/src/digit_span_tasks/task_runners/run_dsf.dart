import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks/src/participant_info/participant_info_dialog.dart';

import '../config/config_dsf.dart';

void runDigitSpanForward() async {
  await showParticipantInfoDialog();
  DigitSpanTasksData data = await Get.to(() => DigitSpanForward(
        config: configDSF,
      ));
  // ignore: avoid_print
  print('\n\n\nFORWARD data \n $data');
}
