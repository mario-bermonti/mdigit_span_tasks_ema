import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import '../config/config_dsf.dart';

Future<DigitSpanTasksData> runDigitSpanForward() async {
  DigitSpanTasksData data = await Get.to(() => DigitSpanForward(
        config: configDSF,
      ));

  /// TODO remove when everything works
  // ignore: avoid_print
  print('\n\n\nFORWARD data \n $data');

  return data;
}
