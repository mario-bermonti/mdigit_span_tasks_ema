
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/informed_consent/consent_controller.dart';
import 'package:research_package/research_package.dart';

class ConsentScreen extends StatelessWidget {
  final ConsentController _controller = Get.put(ConsentController());

  ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RPUITask(
      task: _controller.consentTask,
      onSubmit: (RPTaskResult result) async {
        await _controller.completeConsent();
        await _controller.nextScreen();
      },
      onCancel: (RPTaskResult? result) async {
        await _controller.nextScreen();
      },
    );
  }
}
