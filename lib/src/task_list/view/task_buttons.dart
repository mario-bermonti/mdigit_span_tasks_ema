import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/services/run_session.dart';
import '../../digit_span_tasks/config/config.dart';
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
        'Memoria de números inversos',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
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
        config.practiceMinStimSize = 2;
        config.practiceMaxStimSize = 2;
        config.practiceCountEachSize = 1;
        config.experimentalMinStimSize = 4;
        config.experimentalMaxStimSize = 4;
        config.experimentalCountEachSize = 1;
        config.nextScreen = '/';
        await runSession(taskRunner: runDigitSpanForward);
      },
      child: Text(
        'Memoria de números',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
