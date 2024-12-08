import 'package:mdigit_span_tasks_ema/src/participant/participant_model.dart';

/// Exposes the participant data app-wide.
///
/// [uid] is the unique identifier of the participant.
class ParticipantService {
  late ParticipantModel _participant;

  ParticipantModel get participant => _participant;

  ParticipantService({required String uid}) {
    _participant = ParticipantModel(uid: uid);
  }
}
