import 'package:mdigit_span_tasks_ema/src/core/notifications/models/notification.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/models/notification.dart'
    as ema_db;

const String participantId = 'testParticipantId';
final DateTime now = DateTime.now();

Notification testNotification = Notification(
  notificationId: 'testNotificationId',
  notificationType: 'testNotificationType',
  title: 'testTitle',
  body: 'testBody',
  timeSent: now,
  timeTapped: now,
);

ema_db.Notification testEmaNotification = ema_db.Notification(
  participantId: participantId,
  notificationId: 'testNotificationId',
  notificationType: 'testNotificationType',
  title: 'testTitle',
  body: 'testBody',
  timeSent: now,
  timeTapped: now,
);

final String pathRemoteDB =
    'notifications/$participantId/${testNotification.notificationId}';
