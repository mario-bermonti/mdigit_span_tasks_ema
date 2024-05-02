import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/app_bar/app_bar.dart';

import 'ema_button.dart';

class EMAScreen extends StatelessWidget {
  const EMAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: EMAButton(),
      ),
    );
  }
}
