import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/task_runners/run_dsb.dart';

import '../digit_span_tasks/config/config.dart';
import '../digit_span_tasks/config/stim_dsb.dart';
import '../digit_span_tasks/config/stim_dsf.dart';
import '../digit_span_tasks/task_runners/run_dsf.dart';
import '../services/run_session.dart';

void runEMAdsf() async {
  final DigitSpanTaskConfig config = Get.find();
  config.taskName = 'dsf';
  final DSFStim stim = DSFStim();
  config.practiceStim = stim.practiceStim;
  config.experimentalStim = stim.experimentalStim;
  await runSession(taskRunner: runDigitSpanForward);
}

void runEMAdsb() async {
  final DigitSpanTaskConfig config = Get.find();
  config.taskName = 'dsb';
  final DSBStim stim = DSBStim();
  config.practiceStim = stim.practiceStim;
  config.experimentalStim = stim.experimentalStim;
  await runSession(taskRunner: runDigitSpanBackwards);
}

final List<Function> emaTasks = <Function>[runEMAdsf, runEMAdsb];

Future<void> runEMATasks() async {
  emaTasks.shuffle();
  for (Function emaTask in emaTasks) {
    await emaTask();
  }
  Get.back();
}
