import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/notification_repository.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/models/notification.dart'
    as notification_model;
import 'package:mdigit_span_tasks_ema/src/notifications/models/notification.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_manager.dart';

class NotificationService extends GetxController {
  final String _participantId;
  final NotificationsManager _notificationManager;
  final NotificationRepository _notificationRepository;

  NotificationService({
    required String participantId,
    required NotificationsManager notificationManager,
    required NotificationRepository notificationRepository,
  })  : _participantId = participantId,
        _notificationManager = notificationManager,
        _notificationRepository = notificationRepository;

  static NotificationService init({required String participantId}) {
    return NotificationService(
      participantId: participantId,
      notificationManager: NotificationsManager(participantId: participantId),
      notificationRepository: NotificationRepository(
          remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance)),
    );
  }

  /// Save notification to the remote db.
  void saveMetadataToDB({required Notification notification}) {
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
    _notificationRepository.save(
        notification: notificationModel, pathRemoteDB: pathRemoteDB);
  }
}
