import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/data/survey_data.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';
import 'package:research_package/model.dart';
import 'package:research_package/ui.dart';

import 'baseline_survey_controller.dart';

class BaselineSurveyScreen extends StatelessWidget {
  final BaselineSurveyController controller =
      Get.put(BaselineSurveyController());
  BaselineSurveyScreen({super.key});

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
          onSubmit: (RPTaskResult results) => endBaselineSurvey(results),
        );
      }
    });
  }

  /// Prepares the survey data for exporting, marks the baseline survey as
  /// completed, and moves to the next screen.
  Future<SurveyData> endBaselineSurvey(RPTaskResult results) async {
    final SurveyData surveyData = SurveyData.fromRPTaskResult(
      rpSurveyData: results,
      description: 'Baseline demographics survey',
    );
    print('survey data ${surveyData.toJson()}');
    GetStorage().write('baselineCompleted', true);
    await Get.toNamed('/tasklist');
    return surveyData;
  }
}
