import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/task_runners/run_dsb.dart';

import '../digit_span_tasks/task_runners/run_dsf.dart';
import '../services/run_session.dart';

Future<void> runEMATasks() async {
  await runSession(taskRunner: runDigitSpanForward, taskName: 'ds_forward');
  await runSession(taskRunner: runDigitSpanBackwards, taskName: 'ds_backwards');
  Get.back();
}
