import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/services/run_session.dart';
import '../../digit_span_tasks/task_runners/run_dsb.dart';
import '../../digit_span_tasks/task_runners/run_dsf.dart';

class DSBButton extends StatelessWidget {
  const DSBButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          runSession(taskRunner: runDigitSpanBackwards, dbName: 'ds_backwards'),
      child: Text(
        'Digit Span Backwards',
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
      onPressed: () =>
          runSession(taskRunner: runDigitSpanForward, dbName: 'ds_forward'),
      child: Text(
        'Digit Span Forward',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
