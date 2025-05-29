import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/datasources/getx_datasource.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart';
import 'package:mdigits/src/core/ema_db/participant/participant_repository.dart';

/// Service that handles the participant's metadata.
///
/// It wraps the data repository to manage the metadata.
class ParticipantService {
  final ParticipantRepository _participantRepository;

  ParticipantService({required ParticipantRepository participantRepository})
      : _participantRepository = participantRepository;

  /// Convenience method that initializes the service with all its dependencies.
  ///
  /// It serves as an informal named constructor.
  static init() {
    final ParticipantRepository participantRepository = ParticipantRepository(
      remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
      localDataSource: GetxDataSource(db: GetStorage()),
    );
    return ParticipantService(participantRepository: participantRepository);
  }

  /// Saves the participant to the local and remote databases.
  ///
  /// [participant] is the data model defined in [ema_db].
  Future<void> save({
    required Participant participant,
  }) async {
    await _participantRepository.save(
        participant: participant,
        pathRemoteDB: 'participants/${participant.id}',
        pathLocalDB: 'participant');
  }
}
