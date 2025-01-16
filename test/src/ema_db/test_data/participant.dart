import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart';

const expectedParticipant = Participant(
  id: '101',
  notificationTokens: ['token1', 'token2'],
  nickname: 'TestUser',
  location: 'TestLocation',
  timezone: 'TestTimezone',
  locale: 'test_locale',
  appVersion: '1.0.0',
  appBuildNumber: '100',
);

const String testPathRemoteDB = 'participants';
