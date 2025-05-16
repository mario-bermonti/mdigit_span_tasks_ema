import 'package:flutter/widgets.dart';

class EMAInstructions extends StatelessWidget {
  const EMAInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Vamos a continuar con las actividades que hemos estado practicando.",
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        Text(
          "Lee bien las instrucciones antes de comenzar porque el orden de las actividades cambia.",
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
