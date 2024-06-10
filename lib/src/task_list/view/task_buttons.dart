import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/config/ds_stim.dart';
import 'package:mdigit_span_tasks_ema/src/services/run_session.dart';
import '../../digit_span_tasks/config/config.dart';
import '../../digit_span_tasks/config/stim_dsb.dart';
import '../../digit_span_tasks/config/stim_dsf.dart';
import '../../digit_span_tasks/task_runners/run_dsb.dart';
import '../../digit_span_tasks/task_runners/run_dsf.dart';

class DSBButton extends StatelessWidget {
  const DSBButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final DigitSpanTaskConfig config = Get.find();
        config.taskName = 'dsb';
        config.nextScreen = '/';
        config.practiceMinStimSize = 2;
        config.practiceMaxStimSize = 2;
        config.practiceCountEachSize = 1;
        config.experimentalMinStimSize = 3;
        config.experimentalMaxStimSize = 3;
        config.experimentalCountEachSize = 1;
        await runSession(taskRunner: runDigitSpanBackwards);
      },
      child: Text(
        'Memoria de números al revés',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class DSFButton extends StatelessWidget {
  const DSFButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final DigitSpanTaskConfig config = Get.find();
        config.taskName = 'dsf';
        config.stim = dsfStim;
        config.nextScreen = '/';
        await runSession(taskRunner: runDigitSpanForward);
      },
      child: Text(
        'Memoria de números',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
