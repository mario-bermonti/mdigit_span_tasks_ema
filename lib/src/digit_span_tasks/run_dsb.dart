import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';

import 'config_dsb.dart';

void runDigitSpanBackwards() async {
  DigitSpanTasksData data = await Get.to(() => DigitSpanBackwards(
        config: configDSB,
      ));
  // ignore: avoid_print
  print('\n\n\nBAKWARDS data \n $data');
}
