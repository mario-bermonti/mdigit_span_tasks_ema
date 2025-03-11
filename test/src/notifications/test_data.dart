import 'package:mdigit_span_tasks_ema/src/notifications/models/notification.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/models/notification.dart'
    as ema_db;

const String participantId = '101';
final DateTime now = DateTime.now();

Notification testHandlerNotification = Notification(
  notificationId: 'testNotificationId',
  notificationType: 'testNotificationType',
  title: 'testTitle',
  body: 'testBody',
  timeSent: now,
  timeTapped: now,
);

ema_db.Notification testEmadbNotification = ema_db.Notification(
  participantId: participantId,
  notificationId: 'testNotificationId',
  notificationType: 'testNotificationType',
  title: 'testTitle',
  body: 'testBody',
  timeSent: now,
  timeTapped: now,
);

final String pathRemoteDB =
    'notifications/$participantId/${testHandlerNotification.notificationId}';
