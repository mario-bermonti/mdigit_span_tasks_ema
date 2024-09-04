import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/demographics/process_demographics_data.dart';
import 'package:research_package/research_package.dart';

/// Processes the survey data for exporting, marks the demographics survey as
/// completed, and moves to the next screen.
void endDemographicsSurvey(RPTaskResult results) {
  processDemographicsData(results);
  GetStorage().write('demographicsSurveyCompleted', true);
  Get.toNamed('/tasklist');
}
