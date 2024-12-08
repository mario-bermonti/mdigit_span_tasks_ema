import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/participant/participant_service.dart';

void main() {
  late ParticipantService participantService;

  setUp(() {
    participantService = ParticipantService(uid: '123');
  });

  test(
    "When the first token is added using updateFcmTokens, it should be the only token in the participant's FCM tokens.",
    () {
      participantService.addFcmTokens(fcmToken: 'a');

      expect(participantService.participant.fcmTokens, ['a']);
    },
  );

  test(
    "When a second token is added using updateFcmTokens, the participant's FCM tokens contain both the first and second token.",
    () {
      participantService.addFcmTokens(fcmToken: 'a');
      participantService.addFcmTokens(fcmToken: 'b');

      expect(participantService.participant.fcmTokens, ['a', 'b']);
    },
  );
}
