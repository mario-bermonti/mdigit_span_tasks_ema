import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import '../../participant_info/participant_info_dialog.dart';
import '../config/config_dsb.dart';

void runDigitSpanBackwards() async {
  await showParticipantInfoDialog();
  DigitSpanTasksData data = await Get.to(() => DigitSpanBackwards(
        config: configDSB,
      ));
  // ignore: avoid_print
  print('\n\n\nBAKWARDS data \n $data');
}
