import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/participant_repository.dart';

import '../../../ema_db/test_data/participant.dart';

void main() {
  late FirebaseDataSource firebaseDataSource;
  late ParticipantRepository repository;

  setUp(
    () {
      firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
      repository = ParticipantRepository(
        remoteDataSource: firebaseDataSource,
      );
    },
  );
  group('ParticipantRepository.save', () {
    test(
      "Given a [Participant] and [pathRemoteDB], saves the data to the "
      " remote db.",
      () async {
        await repository.save(
          participant: expectedParticipant,
          pathRemoteDB: testPathRemoteDB,
        );

        final QuerySnapshot<Map<String, dynamic>> participantSnapshot =
            await firebaseDataSource.db.collection(testPathRemoteDB).get();
        final Map<String, dynamic> actualParticipant =
            participantSnapshot.docs.first.data();

        expect(
          actualParticipant,
          expectedParticipant.toJson(),
        );
      },
    );
  });
}
