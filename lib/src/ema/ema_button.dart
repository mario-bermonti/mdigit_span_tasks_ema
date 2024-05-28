import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/ema/run_ema_tasks.dart';

class EMAButton extends StatelessWidget {
  const EMAButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        runEMATasks();
      },
      child: Text(
        'Comenzar',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
