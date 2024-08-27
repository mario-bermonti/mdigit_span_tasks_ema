import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:research_package/research_package.dart';

import '../baseline/data/survey_data.dart';

/// Prepares the survey data for exporting, marks the baseline survey as
/// completed, and moves to the next screen.
Future<SurveyData> endDemographicsSurvey(RPTaskResult results) async {
  final SurveyData surveyData = SurveyData.fromRPTaskResult(
    rpSurveyData: results,
    description: 'Baseline demographics survey',
  );
  print('external survey data ${surveyData.toJson()}');
  GetStorage().write('baselineCompleted', true);
  await Get.toNamed('/tasklist');
  return surveyData;
}
