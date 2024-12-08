import 'package:mdigit_span_tasks_ema/src/participant/participant_model.dart';

/// Exposes the participant data app-wide.
///
/// [uid] is the unique identifier of the participant.
class ParticipantService {
  late ParticipantModel _participant;

  /// Data about the current participant.
  ParticipantModel get participant => _participant;

  ParticipantService({required String uid}) {
    _participant = ParticipantModel(uid: uid);
  }

  /// Updates the participant's FCM tokens.
  void addFcmTokens({required String fcmToken}) {
    final List<String> fcmTokens = [..._participant.fcmTokens, fcmToken];
    _participant = _participant.copyWith(fcmTokens: fcmTokens);
  }
}
