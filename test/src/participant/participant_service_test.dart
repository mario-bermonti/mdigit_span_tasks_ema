import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/participant_repository.dart';
import 'package:mdigit_span_tasks_ema/src/participant/participant_service.dart';

void main() {
  late FakeFirebaseFirestore remoteDB;
  late FirebaseDataSource remoteDataSource;
  late GetStorage localDB;
  late GetxDataSource localDataSource;
  late ParticipantService participantService;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      remoteDB = FakeFirebaseFirestore();
      remoteDataSource = FirebaseDataSource(db: remoteDB);
      localDB = GetStorage();
      localDataSource = GetxDataSource(db: localDB);
      final ParticipantRepository participantRepository = ParticipantRepository(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
      );
      participantService =
          ParticipantService(participantRepository: participantRepository);
    },
  );
  tearDown(() async {
    await remoteDB.clearPersistence();
    await localDB.erase();
  });
  group('ParticipantService.save', () {
    test(
      "Given a [participant], saves it to 'participants/{participant.id}' "
      "in the remote db and 'participant' in the local db.",
      () async {
        const Participant participant = Participant(
          id: 'id',
          notificationTokens: ["0123456789"],
        );

        await participantService.save(participant: participant);

        /// assert remote db
        final DocumentSnapshot<Map<String, dynamic>> participantSnapshot =
            await remoteDB.doc('participants/${participant.id}').get();
        final Participant actualRemoteParticipant =
            Participant.fromJson(participantSnapshot.data()!);
        expect(
          actualRemoteParticipant,
          participant,
        );

        /// assert local db
        final Participant actualLocalParticipant =
            Participant.fromJson(localDB.read('participant'));
        expect(actualLocalParticipant, participant);
      },
    );
  });
}
