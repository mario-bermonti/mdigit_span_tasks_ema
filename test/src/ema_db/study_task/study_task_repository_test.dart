import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/metadata/metadata.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/survey/survey.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/survey/survey_item.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/study_task_repository.dart';

void main() {
  late StudyTaskRepository repository;
  late FirebaseDataSource firebaseDataSource;

  setUp((() {
    firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
    repository = StudyTaskRepository(remoteDataSource: firebaseDataSource);
  }));

  test(
    "Given a [StudyTask] and [path], [saveStudyTask] should save the task's "
    "metadata and items to the db.",
    () async {
      final Metadata expectedMetadata = Metadata(
        participantID: "101",
        sessionID: "001",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'metadata id',
        description: "metadata description",
      );

      final SurveyItem surveyItem1 = SurveyItem(
        participantID: "101",
        sessionID: "001",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'identifier A',
        description: "description A",
        type: "SingleChoice",
        response: "response A",
      );

      final SurveyItem surveyItem2 = SurveyItem(
        participantID: "102",
        sessionID: "001",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'identifier B',
        description: "description B",
        type: "SingleChoice",
        response: "response B",
      );

      final List<SurveyItem> expectedItems = [surveyItem1, surveyItem2];

      final Survey expectedSurvey = Survey(
        metadata: expectedMetadata,
        items: expectedItems,
      );

      const String path = 'surveys/participants/101/demographics/sessions/001';
      await repository.saveStudyTask(
        studyTask: expectedSurvey,
        path: path,
      );

      /// assert metadata
      final QuerySnapshot<Map<String, dynamic>> metadataSnapshot =
          await firebaseDataSource.db.collection('$path/metadata').get();
      final Metadata actualMetadata =
          Metadata.fromJson(metadataSnapshot.docs.first.data());
      expect(actualMetadata, expectedMetadata);

      /// assert items
      final QuerySnapshot<Map<String, dynamic>> itemsSnapshot =
          await firebaseDataSource.db.collection('$path/items').get();
      final List<SurveyItem> actualItems = itemsSnapshot.docs.map((item) {
        return SurveyItem.fromJson(item.data());
      }).toList();
      expect(actualItems, expectedItems);

      /// assert study task
      final actualSurvey = Survey(
        metadata: actualMetadata,
        items: actualItems,
      );
      expect(actualSurvey, expectedSurvey);
    },
  );
}
