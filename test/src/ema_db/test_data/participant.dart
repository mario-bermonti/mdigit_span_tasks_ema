import 'package:mdigits/src/core/ema_db/participant/models/participant.dart';

const testParticipant = Participant(
  id: '101',
  notificationTokens: ['token1', 'token2'],
  nickname: 'TestUser',
  location: 'TestLocation',
  timezone: 'TestTimezone',
  locale: 'test_locale',
  appVersion: '1.0.0',
  appBuildNumber: '100',
);
Map<String, dynamic> testParticipantJson = testParticipant.toJson();

const String testPathRemoteDB = 'participants/101';
const String testPathLocalDB = 'participant';
