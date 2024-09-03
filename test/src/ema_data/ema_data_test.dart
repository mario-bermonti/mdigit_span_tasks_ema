import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/data/survey_data.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/data/survey_item_data.dart';
import 'package:mdigit_span_tasks_ema/src/ema_data/ema_data.dart';

void main() {
  late EMAData db;
  setUp(() {
    db = EMAData(FakeFirebaseFirestore(), participantID: '101');
  });

  group('addCrossSectionalSurveyData', () {
    test(
      """Given a appropriate [basePath], [measureName], and [SurveyData],
      adds the survey metadata to Firebase.""",
      () async {
        final SurveyItemData dateItem = SurveyItemData(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          identifier: 'today',
          description: 'Today\'s date',
          type: 'Date',
          response: '2024-04-07 00:00:00.000',
        );

        final SurveyItemData colorItem = SurveyItemData(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          identifier: 'color',
          description: 'What color do you prefer?',
          type: 'SingleChoice',
          response: 'Black',
          choices: ['Black', 'White'],
        );

        final SurveyData rawData = SurveyData(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          identifier: 'survey_test',
          description: 'Survey for testing',
          items: [dateItem, colorItem],
        );

        final Map<String, dynamic> expectedMetadata = rawData.toJson();
        expectedMetadata.remove('items');

        await db.addCrossSectionalSurveyData(
          measureName: 'test_survey',
          data: rawData,
        );

        final DocumentSnapshot metadataSnapshot = await db.db
            .collection('cross_sectional')
            .doc('test_survey')
            .collection('participants')
            .doc(db.participantID)
            .collection('metadata')
            .doc('metadata')
            .get();
        final actualMetadata = metadataSnapshot.data() as Map<String, dynamic>;

        expect(actualMetadata, expectedMetadata);
      },
    );
    test(
      """Given a appropriate [basePath], [measureName], and [SurveyData],
      adds the survey item data to Firebase.""",
      () async {
        final SurveyItemData dateItem = SurveyItemData(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          identifier: 'today',
          description: 'Today\'s date',
          type: 'Date',
          response: '2024-04-07 00:00:00.000',
        );

        final SurveyItemData colorItem = SurveyItemData(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          identifier: 'color',
          description: 'What color do you prefer?',
          type: 'SingleChoice',
          response: 'Black',
          choices: ['Black', 'White'],
        );

        final SurveyData rawData = SurveyData(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          identifier: 'survey_test',
          description: 'Survey for testing',
          items: [dateItem, colorItem],
        );

        await db.addCrossSectionalSurveyData(
          measureName: 'test_survey',
          data: rawData,
        );

        final QuerySnapshot<Map<String, dynamic>> itemsSnapshot = await db.db
            .collection('cross_sectional')
            .doc('test_survey')
            .collection('participants')
            .doc(db.participantID)
            .collection('items')
            .get();
        final List<Map<String, dynamic>> actualItems =
            itemsSnapshot.docs.map((item) => item.data()).toList();

        expect(actualItems, [dateItem.toJson(), colorItem.toJson()]);
      },
    );
  });
  test(
    """Given a appropriate [basePath], [measureName], and [SurveyData],
      addCrossSectionalSurveyMetadata adds the survey metadata to Firebase.""",
    () async {
      final SurveyItemData dateItem = SurveyItemData(
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'today',
        description: 'Today\'s date',
        type: 'Date',
        response: '2024-04-07 00:00:00.000',
      );

      final SurveyItemData colorItem = SurveyItemData(
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'color',
        description: 'What color do you prefer?',
        type: 'SingleChoice',
        response: 'Black',
        choices: ['Black', 'White'],
      );

      final SurveyData rawData = SurveyData(
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'survey_test',
        description: 'Survey for testing',
        items: [dateItem, colorItem],
      );

      final Map<String, dynamic> expectedMetadata = rawData.toJson();
      expectedMetadata.remove('items');

      await db.addCrossSectionalSurveyMetadata(
        measureName: 'test_survey',
        data: expectedMetadata,
      );

      final DocumentSnapshot metadataSnapshot = await db.db
          .collection('cross_sectional')
          .doc('test_survey')
          .collection('participants')
          .doc(db.participantID)
          .collection('metadata')
          .doc('metadata')
          .get();
      final actualMetadata = metadataSnapshot.data() as Map<String, dynamic>;

      expect(actualMetadata, expectedMetadata);
    },
  );
  test(
    """Given a appropriate [basePath], [measureName], and [SurveyData],
      addCrossSectionalSurveyItemData adds the survey item data to Firebase.""",
    () async {
      final SurveyItemData dateItem = SurveyItemData(
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'today',
        description: 'Today\'s date',
        type: 'Date',
        response: '2024-04-07 00:00:00.000',
      );

      final SurveyItemData colorItem = SurveyItemData(
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'color',
        description: 'What color do you prefer?',
        type: 'SingleChoice',
        response: 'Black',
        choices: ['Black', 'White'],
      );

      final SurveyData rawData = SurveyData(
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'survey_test',
        description: 'Survey for testing',
        items: [dateItem, colorItem],
      );

      await db.addCrossSectionalSurveyItemData(
        measureName: 'test_survey',
        data: rawData.toJson()['items'],
      );

      final QuerySnapshot<Map<String, dynamic>> itemsSnapshot = await db.db
          .collection('cross_sectional')
          .doc('test_survey')
          .collection('participants')
          .doc(db.participantID)
          .collection('items')
          .get();
      final List<Map<String, dynamic>> actualItems =
          itemsSnapshot.docs.map((item) => item.data()).toList();

      expect(actualItems, [dateItem.toJson(), colorItem.toJson()]);
    },
  );
}
