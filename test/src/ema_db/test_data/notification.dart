import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/models/notification.dart';

final Notification testNotification = Notification(
  participantId: 'testParticipantId',
  notificationId: 'testNotificationId',
  notificationType: 'testNotificationType',
  title: 'testTitle',
  body: 'testBody',
  timeSent: DateTime.now(),
  timeTapped: DateTime.now(),
);

final String testPathRemoteDB =
    'notifications/participants/${testNotification.participantId}';
