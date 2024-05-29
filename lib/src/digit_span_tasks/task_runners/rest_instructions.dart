import 'package:flutter/material.dart';

class RestInstructions extends StatelessWidget {
  const RestInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Toma un descanso',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
