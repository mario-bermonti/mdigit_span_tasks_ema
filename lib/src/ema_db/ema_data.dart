import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigit_span_tasks_ema/src/surveys/data/survey_data.dart';
import 'package:mdigit_span_tasks_ema/src/surveys/data/survey_item_data.dart';

class EMAData {
  final FirebaseFirestore db;
  final String participantID;

  EMAData(
    this.db, {
    required this.participantID,
  });

  /// Adds data from a cross-sectional survey data to Firebase
  Future<void> addCrossSectionalSurveyData({
    required String measureName,
    required SurveyData data,
  }) async {
    final Map<String, dynamic> surveyData = data.toJson();

    await addCrossSectionalSurveyItemData(
      measureName: measureName,
      data: surveyData['items'],
    );

    surveyData.remove('items');
    await addCrossSectionalSurveyMetadata(
      measureName: measureName,
      data: surveyData,
    );
  }

  /// Add data from cross-sectional items to Firebase
  Future<void> addCrossSectionalSurveyItemData({
    required String measureName,
    required List<SurveyItemData> data,
  }) async {
    final CollectionReference itemsRef = db
        .collection('cross_sectional')
        .doc(measureName)
        .collection('participants')
        .doc(participantID)
        .collection('items');

    final WriteBatch batch = db.batch();

    for (SurveyItemData item in data) {
      Map<String, dynamic> jsonItem = item.toJson();
      batch.set(itemsRef.doc(item.identifier), jsonItem);
    }
    await batch.commit();
  }

  /// Add metadata from a cross-sectional survey to Firebase
  Future<void> addCrossSectionalSurveyMetadata({
    required String measureName,
    required Map<String, dynamic> data,
  }) async {
    final CollectionReference metadataRef = db
        .collection('cross_sectional')
        .doc(measureName)
        .collection('participants')
        .doc(participantID)
        .collection('metadata');

    await metadataRef.doc('metadata').set(data);
  }
}
