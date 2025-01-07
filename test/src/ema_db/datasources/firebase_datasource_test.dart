import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/models/ema_model.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/survey/survey_item.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/task_item.dart';

void main() {
  late FirebaseDataSource db;

  setUp(() {
    db = FirebaseDataSource(db: FakeFirebaseFirestore());
  });

  test(
    "Given valid [EMAModel] and db [path], [saveEMAModel] should save the model "
    "to Firebase in the specified [path]",
    () async {
      final TaskItem surveyItem = SurveyItem(
        participantID: "101",
        sessionID: "001",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'identifier A',
        description: "description A",
        type: "SingleChoice",
        response: "response A",
      );

      const String path = 'test_path';

      await db.saveEMAModel(emaModel: surveyItem, path: path);

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.db.collection(path).get();
      final Map<String, dynamic> actual = snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList()
          .first;

      expect(actual, surveyItem.toJson());
    },
  );
  test(
    "Given a valid list of [EMAModel]s and db [path], [saveEMAModels] should "
    "save the models to Firebase in the specified [path]",
    () async {
      final TaskItem surveyItem1 = SurveyItem(
        participantID: "101",
        sessionID: "001",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'identifier A',
        description: "description A",
        type: "SingleChoice",
        response: "response A",
      );

      final TaskItem surveyItem2 = SurveyItem(
        participantID: "102",
        sessionID: "001",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        identifier: 'identifier B',
        description: "description B",
        type: "SingleChoice",
        response: "response B",
      );
      final List<EMAModel> emaModels = [surveyItem1, surveyItem2];
      final List<Map<String, dynamic>> expected =
          emaModels.map((EMAModel emaModel) => emaModel.toJson()).toList();
      const String path = 'test_path';

      await db.saveEMAModels(emaModels: emaModels, path: path);

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.db.collection(path).get();
      final List<Map<String, dynamic>> actual = snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList();

      expect(actual, expected);
    },
  );
}
