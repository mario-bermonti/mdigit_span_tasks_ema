import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/ema_db.dart';
import 'package:mdigit_span_tasks_ema/src/surveys/data/survey_data.dart';

/// Provides a simple interface for managing data on Firebase.
class EMAFirebaseDB implements EMADB {
  /// Adds data from a cross-sectional survey data to Firebase
  @override
  Future<void> addCrossSectionalSurveyData({
    required CollectionReference collectionRef,
    required SurveyData data,
  }) {
    // TODO: implement addCrossSectionalSurveyData
    throw UnimplementedError();
  }
}
