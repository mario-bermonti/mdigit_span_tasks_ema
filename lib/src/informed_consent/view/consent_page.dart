import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/informed_consent/viewmodel/consent_viewmodel.dart';
import 'package:research_package/research_package.dart';

class ConsentPage extends StatelessWidget {
  final ConsentViewModel _viewmodel = Get.put(ConsentViewModel());

  ConsentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RPUITask(
      task: _viewmodel.consentTask,
      onSubmit: (RPTaskResult result) async {
        await _viewmodel.completeConsent();
        await _viewmodel.nextScreen();
      },
      onCancel: (RPTaskResult? result) async {
        await _viewmodel.nextScreen();
      },
    );
  }
}
