import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

import '../test_data/general.dart';
import '../test_data/survey.dart';

void main() {
  late FirebaseDataSource db;

  setUp(() {
    db = FirebaseDataSource(db: FakeFirebaseFirestore());
  });

  test(
    "Given valid [EMAModel] and db [path], [saveEMAModel] should save the model "
    "to Firebase in the specified [path]",
    () async {
      await db.saveEMAModel(
          emaModel: expectedSurveyItem, path: collectionRefPath);

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.db.collection(collectionRefPath).get();
      final Map<String, dynamic> actual = snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList()
          .first;

      expect(actual, expectedSurveyItem.toJson());
    },
  );
  test(
    "Given a valid list of [EMAModel]s and db [path], [saveEMAModels] should "
    "save the models to Firebase in the specified [path]",
    () async {
      final List<Map<String, dynamic>> expected = expectedSurveyItems
          .map((EMAModel emaModel) => emaModel.toJson())
          .toList();

      await db.saveEMAModels(
          emaModels: expectedSurveyItems, path: collectionRefPath);

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.db.collection(collectionRefPath).get();
      final List<Map<String, dynamic>> actual = snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList();

      expect(actual, expected);
    },
  );
}
