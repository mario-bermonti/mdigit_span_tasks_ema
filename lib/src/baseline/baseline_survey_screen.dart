import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/demographics/end_demographics_survey.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';
import 'package:research_package/model.dart';
import 'package:research_package/ui.dart';

import 'baseline_survey_controller.dart';

class BaselineSurveyScreen extends StatelessWidget {
  final BaselineSurveyController controller =
      Get.put(BaselineSurveyController());
  final Function onSubmit;

  BaselineSurveyScreen({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const LoadingScreen();
      } else {
        final RPOrderedTask survey = RPOrderedTask(
          identifier: 'baseline',
          steps: controller.questions,
          closeAfterFinished: false,
        );

        return RPUITask(
          task: survey,
          onSubmit: (RPTaskResult results) => endDemographicsSurvey(results),
        );
      }
    });
  }
}
