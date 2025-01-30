import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/participant_repository.dart';

import '../../../ema_db/test_data/participant.dart';

void main() {
  late FirebaseDataSource firebaseDataSource;
  late GetStorage getStorage;
  late GetxDataSource getxDataSource;
  late ParticipantRepository repository;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
      getStorage = GetStorage();
      getxDataSource = GetxDataSource(db: getStorage);

      repository = ParticipantRepository(
        remoteDataSource: firebaseDataSource,
        localDataSource: getxDataSource,
      );
    },
  );
  tearDown(() async {
    await firebaseDataSource.db.clearPersistence();
    await getStorage.erase();
  });
  group('ParticipantRepository.save', () {
    test(
      "Given a [Participant], [pathRemoteDB], [pathLocalDB], saves the data to "
      "the remote and local dbs.",
      () async {
        await repository.save(
          participant: testParticipant,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        /// assert remote db
        final DocumentSnapshot<Map<String, dynamic>> participantSnapshot =
            await firebaseDataSource.db.doc(testPathRemoteDB).get();
        final Map<String, dynamic>? actualRemoteParticipant =
            participantSnapshot.data();

        expect(
          actualRemoteParticipant,
          testParticipantJson,
        );

        /// assert local db
        Map<String, dynamic> actualLocalParticipant =
            getStorage.read(testPathLocalDB);

        expect(
          actualLocalParticipant,
          testParticipantJson,
        );
      },
    );
    test(
      "Given a [Participant], [pathRemoteDB], [pathLocalDB], update the data to "
      "the remote and local dbs, without override values that are not passed.",
      () async {
        await firebaseDataSource.db.doc(testPathRemoteDB).set(
              testParticipantJson,
            );

        const Participant incompleteParticipant = Participant(
          id: '101',
          nickname: 'TestUserModified',
          appBuildNumber: '101',
        );

        await repository.save(
          participant: incompleteParticipant,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Participant expectedParticipant = testParticipant.copyWith(
          id: incompleteParticipant.id,
          nickname: incompleteParticipant.nickname,
          appBuildNumber: incompleteParticipant.appBuildNumber,
        );

        /// assert remote db
        final DocumentSnapshot<Map<String, dynamic>> participantSnapshot =
            await firebaseDataSource.db.doc(testPathRemoteDB).get();
        final Map<String, dynamic>? actualRemoteParticipant =
            participantSnapshot.data();

        expect(
          actualRemoteParticipant,
          expectedParticipant.toJson(),
        );

        /// assert local db
        Map<String, dynamic> actualLocalParticipant =
            getStorage.read(testPathLocalDB);

        expect(
          actualLocalParticipant,
          expectedParticipant.toJson(),
        );
      },
    );
  });
  group("ParticipantRepository.load", () {
    test(
      "Given a [pathRemoteDB] and [pathLocalDB], loads the data from remote db.",
      () async {
        await firebaseDataSource.db
            .doc(testPathRemoteDB)
            .set(testParticipantJson);

        final Participant? actualRemoteParticipant = await repository.get(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        expect(actualRemoteParticipant, testParticipant);
      },
    );
    test(
      "Given a [pathRemoteDB] and [pathLocalDB], loads the data from local db "
      "if remote data is null.",
      () async {
        await getxDataSource.db.write(testPathLocalDB, testParticipantJson);

        final Participant? actualParticipant = await repository.get(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        expect(actualParticipant, testParticipant);
      },
    );
    test(
      "Given valid [pathRemoteDB] and [pathLocalDB], updates local data with "
      "remote data if remote data exists.",
      () async {
        await firebaseDataSource.db
            .doc(testPathRemoteDB)
            .set(testParticipantJson);

        await repository.get(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        final Map<String, dynamic>? actualLocalParticipant =
            getStorage.read(testPathLocalDB);

        expect(
          actualLocalParticipant,
          testParticipantJson,
        );
      },
    );
    test(
      "Given valid [pathRemoteDB] and [pathLocalDB], returns null if both remote "
      "and local data are null.",
      () async {
        final Participant? actualParticipant = await repository.get(
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        expect(actualParticipant, null);
      },
    );
  });
}
