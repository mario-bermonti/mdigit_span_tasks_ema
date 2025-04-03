import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/app_bar/app_bar.dart';

import 'ema_button.dart';

class EMAScreen extends StatelessWidget {
  const EMAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Vamos a continuar con las tareas que hemos estado practicando.",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text("Lee bien las instrucciones antes de comenzar porque el orden de las actividades cambia.",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            EMAButton(),
          ],
        ),
      ),
    );
  }
}
