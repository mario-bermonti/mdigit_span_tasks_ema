import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/navigator_service/navigator_service.dart';
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/task_runners/run_dsb.dart';

import '../digit_span_tasks/config/config.dart';
import '../digit_span_tasks/task_runners/run_dsf.dart';
import '../services/run_session.dart';

void runEMAdsf() async {
  final DigitSpanTaskConfig config = Get.find();
  config.taskName = 'dsf';
  config.practiceMinStimSize = 2;
  config.practiceMaxStimSize = 2;
  config.practiceCountEachSize = 1;
  config.experimentalMinStimSize = 4;
  config.experimentalMaxStimSize = 4;
  config.experimentalCountEachSize = 1;
  await runSession(taskRunner: runDigitSpanForward);
}

void runEMAdsb() async {
  final DigitSpanTaskConfig config = Get.find();
  config.taskName = 'dsb';
  config.practiceMinStimSize = 2;
  config.practiceMaxStimSize = 2;
  config.practiceCountEachSize = 1;
  config.experimentalMinStimSize = 3;
  config.experimentalMaxStimSize = 3;
  config.experimentalCountEachSize = 1;
  await runSession(taskRunner: runDigitSpanBackwards);
}

final List<Function> emaTasks = <Function>[runEMAdsf, runEMAdsb];

Future<void> runEMATasks() async {
  final DigitSpanTaskConfig config = Get.find();
  config.nextScreen = '/loading';
  emaTasks.shuffle();
  for (Function emaTask in emaTasks) {
    // TODO: Find a better solution. See issue #99.
    /// This temporary solution allows starting a cognitive task if a cognitive
    /// task is already running, but has serious side effects.
    Get.deleteAll();
    await emaTask();
  }
  final NavigatorService navigatorService = Get.find();
  final String nextScreen = await navigatorService.determineNextScreen();
  Get.offAndToNamed(nextScreen);
}
