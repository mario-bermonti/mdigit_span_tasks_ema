import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/app_bar/app_bar.dart';
import 'package:mdigit_span_tasks_ema/src/ema/ema_instructions.dart';

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
            EMAInstructions(),
            SizedBox(height: 60),
            EMAButton(),
          ],
        ),
      ),
    );
  }
}
