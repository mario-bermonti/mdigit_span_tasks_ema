import 'dart:math';

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
  group('ParticipantRepository.save', () {
    test(
      "Given a [Participant], [pathRemoteDB], [pathLocalDB], saves the data to "
      "the remote and local dbs.",
      () async {
        await repository.save(
          participant: expectedParticipant,
          pathRemoteDB: testPathRemoteDB,
          pathLocalDB: testPathLocalDB,
        );

        /// assert remote db
        final QuerySnapshot<Map<String, dynamic>> participantSnapshot =
            await firebaseDataSource.db.collection(testPathRemoteDB).get();
        final Map<String, dynamic> actualRemoteParticipant =
            participantSnapshot.docs.first.data();

        expect(
          actualRemoteParticipant,
          expectedParticipantJson,
        );

        /// assert local db
        Map<String, dynamic> actualLocalParticipant =
            getStorage.read(testPathLocalDB);

        expect(
          actualLocalParticipant,
          expectedParticipantJson,
        );
      },
    );
  });
  group("ParticipantRepository.load", () {
    test(
      "Given a [pathRemoteDB] and [pathLocalDB], loads the data from local "
      "and remote dbs.",
      () async {
        /// create data for extraction
        await firebaseDataSource.db
            .collection(testPathRemoteDB)
            .add(expectedParticipantJson);

        final Participant actualRemoteParticipant = await repository.load(
          pathRemoteDB: testPathRemoteDB,
        );
        print(actualRemoteParticipant);
        print(expectedParticipant);

        /// remote db
        expect(actualRemoteParticipant, expectedParticipant);
      },
    );
  });
}
