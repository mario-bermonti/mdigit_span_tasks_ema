import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';
import 'package:research_package/model.dart';
import 'package:research_package/ui.dart';

import 'demographics_survey_controller.dart';

class DemographicsSurvey extends StatelessWidget {
  final DemographicsSurveyController controller =
      Get.put(DemographicsSurveyController());
  final Function onSubmit;
  final Function onCancel;

  DemographicsSurvey({
    super.key,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const LoadingScreen();
      } else {
        final RPOrderedTask survey = RPOrderedTask(
          identifier: 'demographics',
          steps: controller.questions,
          closeAfterFinished: false,
        );

        return RPUITask(
          task: survey,
          onSubmit: (RPTaskResult results) async => await onSubmit(results),
          onCancel: (RPTaskResult? results) async => await onCancel(),
        );
      }
    });
  }
}
