import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigit_span_tasks_ema/src/surveys/data/survey_data.dart';

/// Interface that all data managers must implement
abstract class EMADB {
  Future<void> addCrossSectionalSurveyData({
    required CollectionReference collectionRef,
    required SurveyData data,
  });
}
