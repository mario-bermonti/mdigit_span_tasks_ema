import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/notifications/notification_repository.dart';
import 'package:mdigits/src/core/ema_db/notifications/models/notification.dart'
    as notification_model;
import 'package:mdigits/src/core/notifications/models/notification.dart';

class NotificationsRepositoryService extends GetxController {
  final String _participantId;
  final NotificationRepository _notificationRepository;

  NotificationsRepositoryService({
    required String participantId,
    required NotificationRepository notificationRepository,
  })  : _participantId = participantId,
        _notificationRepository = notificationRepository;

  NotificationsRepositoryService.init({required String participantId})
      : _participantId = participantId,
        _notificationRepository = NotificationRepository(
            remoteDataSource:
                FirebaseDataSource(db: FirebaseFirestore.instance));

  /// Save notification to the remote db.
  Future<void> save({required Notification notification}) async {
    final notification_model.Notification notificationModel =
        notification_model.Notification(
      participantId: _participantId,
      notificationId: notification.notificationId,
      notificationType: notification.notificationType,
      title: notification.title,
      body: notification.body,
      timeSent: notification.timeSent,
      timeTapped: notification.timeTapped,
    );

    final String pathRemoteDB =
        'notifications/$_participantId/${notification.notificationId}';
    await _notificationRepository.save(
        notification: notificationModel, pathRemoteDB: pathRemoteDB);
  }
}
