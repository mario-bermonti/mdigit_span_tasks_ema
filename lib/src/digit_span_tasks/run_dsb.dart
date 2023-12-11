import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';

void runDigitSpanBackwards() async {
  UserConfig config = UserConfig(
    stimListPractice: ['23', '567'],
    stimListExperimental: ['0123', '45678', '901234'],
  );
  DigitSpanTasksData data = await Get.to(() => DigitSpanBackwards(
        config: config,
      ));
  // ignore: avoid_print
  print('\n\n\nBAKWARDS data \n $data');
}
