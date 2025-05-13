import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/screen.dart';

class Instructions extends StatelessWidget {
  final Widget instructions;

  const Instructions({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: Column(
        children: <Widget>[
          instructions,
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(
              'Continuar',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class InstructionsText extends StatelessWidget {
  final String text;
  const InstructionsText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}
