import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/models/ema_model.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart';

import '../test_data/participant.dart';
import '../test_data/remote_datasource.dart';
import '../test_data/survey.dart';

void main() {
  late FirebaseDataSource firebaseDataSource;

  setUp(() {
    firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
  });

  test(
    "Given valid [EMAModel] and db [path], [saveEMAModel] should save the model "
    "to Firebase in the specified [path]",
    () async {
      await firebaseDataSource.saveEMAModel(
          emaModel: testSurveyItem, path: collectionRefPath);

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firebaseDataSource.db.collection(collectionRefPath).get();
      final Map<String, dynamic> actual = snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList()
          .first;

      expect(actual, testSurveyItem.toJson());
    },
  );
  test(
    "Given a valid list of [EMAModel]s and db [path], [saveEMAModels] should "
    "save the models to Firebase in the specified [path]",
    () async {
      final List<Map<String, dynamic>> expected = testSurveyItems
          .map((EMAModel emaModel) => emaModel.toJson())
          .toList();

      await firebaseDataSource.saveEMAModels(
          emaModels: testSurveyItems, path: collectionRefPath);

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firebaseDataSource.db.collection(collectionRefPath).get();
      final List<Map<String, dynamic>> actual = snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => doc.data())
          .toList();

      expect(actual, expected);
    },
  );
  group("FirebaseDataSource.saveNamedEMAModel", () {
    test(
      "Given a valid [EMAModel] and db [path], saves the model to the doc "
      "specified by [path]",
      () async {
        await firebaseDataSource.saveNamedEMAModel(
          emaModel: testSurveyItem,
          path: testNamedPath,
        );

        final DocumentSnapshot<Map<String, dynamic>> snapshot =
            await firebaseDataSource.db.doc(testNamedPath).get();
        final Map<String, dynamic>? actualSurveyItem = snapshot.data();

        expect(actualSurveyItem, testSurveyItem1Json);
      },
    );
  });

  group("FirebaseDataSource.updateEMAModel", () {
    test(
      "Given a valid [EMAModel] and db [path], updates the model in the doc "
      "without modifying fields that were already present in the remote db.",
      () async {
        await firebaseDataSource.db.doc(testNamedPath).set(
              testParticipantJson,
            );

        const Participant incompleteParticipant = Participant(
          id: '101',
          nickname: 'TestUserModified',
          appBuildNumber: '101',
        );

        await firebaseDataSource.updateEMAModel(
          emaModel: incompleteParticipant,
          path: testNamedPath,
        );

        final Participant expectedParticipant = testParticipant.copyWith(
          id: incompleteParticipant.id,
          nickname: incompleteParticipant.nickname,
          appBuildNumber: incompleteParticipant.appBuildNumber,
        );

        final DocumentSnapshot<Map<String, dynamic>> actualParticipant =
            await firebaseDataSource.db.doc(testNamedPath).get();

        expect(actualParticipant.data(), expectedParticipant.toJson());
      },
    );
    test(
      "Given a valid [EMAModel] and db [path], adds new elements to arrays "
      "without losing elements that were already present in the remote db.",
      () async {
        await firebaseDataSource.db.doc(testNamedPath).set(
              testParticipantJson,
            );

        const Participant incompleteParticipant = Participant(
          id: '101',
          nickname: 'TestUserModified',
          notificationTokens: ['token3'],
          appBuildNumber: '101',
        );

        await firebaseDataSource.updateEMAModel(
          emaModel: incompleteParticipant,
          path: testNamedPath,
        );

        final List<String> expectedTokens =
            testParticipant.notificationTokens! +
                incompleteParticipant.notificationTokens!;

        final Participant expectedParticipant = testParticipant.copyWith(
          id: incompleteParticipant.id,
          notificationTokens: expectedTokens,
          nickname: incompleteParticipant.nickname,
          appBuildNumber: incompleteParticipant.appBuildNumber,
        );

        final DocumentSnapshot<Map<String, dynamic>> actualParticipant =
            await firebaseDataSource.db.doc(testNamedPath).get();

        expect(actualParticipant.data(), expectedParticipant.toJson());
      },
    );
  });

  group("FirebaseDataSource.getDataModel", () {
    test(
      "Given a valid [path], returns the data as a Map<String, dynamic>",
      () async {
        await firebaseDataSource.db.doc(testNamedPath).set(
              testSurveyItem1Json,
            );

        final Map<String, dynamic>? actualSurveyItem =
            await firebaseDataSource.getDataModel(path: testNamedPath);

        expect(actualSurveyItem, testSurveyItem1Json);
      },
    );
    test(
      "Given a [path] to a doc that does not exist, returns null",
      () async {
        final Map<String, dynamic>? actualSurveyItem =
            await firebaseDataSource.getDataModel(path: testNamedPath);

        expect(actualSurveyItem, null);
      },
    );
  });
}
