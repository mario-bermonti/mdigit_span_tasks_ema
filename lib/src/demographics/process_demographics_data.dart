import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';
import 'package:mdigit_span_tasks_ema/src/ema_data/ema_data.dart';
import 'package:research_package/research_package.dart';

import '../baseline/data/survey_data.dart';

/// Converts the [RPTaskResult] into a [SurveyData] object.
void processDemographicsData(RPTaskResult results) {
  final SurveyData surveyData = SurveyData.fromRPTaskResult(
    rpSurveyData: results,
    description: 'Baseline demographics survey',
  );
  final Participant participant = Get.find();
  final EMAData emaData = EMAData(
    FirebaseFirestore.instance,
    participantID: participant.id,
  );
  emaData.addCrossSectionalSurveyData(
    measureName: 'demographics',
    data: surveyData,
  );
}
