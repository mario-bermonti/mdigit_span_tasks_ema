import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/task_runners/run_dsb.dart';

import '../digit_span_tasks/task_runners/run_dsf.dart';
import '../services/run_session.dart';

void runEMAdsf() async {
  await runSession(taskRunner: runDigitSpanForward, taskName: 'ds_forward');
}

void runEMAdsb() async {
  await runSession(taskRunner: runDigitSpanBackwards, taskName: 'ds_backwards');
}

final List<Function> emaTasks = <Function>[runEMAdsf, runEMAdsb];

Future<void> runEMATasks() async {
  emaTasks.shuffle();
  for (Function emaTask in emaTasks) {
    await emaTask();
  }
  Get.back();
}
