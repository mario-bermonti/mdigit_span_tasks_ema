import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import '../config/config_dsb.dart';

Future<DigitSpanTasksData> runDigitSpanBackwards() async {
  DigitSpanTasksData data = await Get.to(() => DigitSpanBackwards(
        config: configDSB,
      ));

  /// TODO remove when everything works
  // ignore: avoid_print
  print('\n\n\nBAKWARDS data \n $data');
  return data;
}
