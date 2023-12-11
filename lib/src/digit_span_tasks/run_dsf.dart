import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';

void runDigitSpanForward() async {
  UserConfig config = UserConfig(
    stimListPractice: ['01', '234'],
    stimListExperimental: ['5678', '01567', '987654'],
  );
  DigitSpanTasksData data = await Get.to(() => DigitSpanForward(
        config: config,
      ));
  // ignore: avoid_print
  print('\n\n\nFORWARD data \n $data');
}
