import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/survey/survey_item.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/task_item.dart';

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
    },
  );
}
