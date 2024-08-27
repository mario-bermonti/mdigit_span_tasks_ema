import 'package:research_package/research_package.dart';

import '../baseline/data/survey_data.dart';

/// Converts the [RPTaskResult] into a [SurveyData] object.
void processDemographicsData(RPTaskResult results) {
  final SurveyData surveyData = SurveyData.fromRPTaskResult(
    rpSurveyData: results,
    description: 'Baseline demographics survey',
  );
  print('survey data: ${surveyData.toJson()}');
}
