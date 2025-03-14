import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  /// Returns the token used to send remote notifications to user.
  Future<String?> getToken() async => await _notificationManager.getToken();

  bool get localNotificationsEnabled =>
      _notificationManager.localNotificationsEnabled;
  bool get remoteNotificationsEnabled =>
      _notificationManager.remoteNotificationsEnabled;
  RemoteMessage? get notificationWhileOnTerminated =>
      _notificationManager.notificationWhileOnTerminated;

  NotificationService({
    required String participantId,
    required NotificationsManager notificationManager,
    required NotificationRepository notificationRepository,
  })  : _participantId = participantId,
        _notificationManager = notificationManager,
        _notificationRepository = notificationRepository;

  NotificationService.init({required String participantId})
      : _participantId = participantId,
        _notificationManager = NotificationsManager(),
        _notificationRepository = NotificationRepository(
            remoteDataSource:
                FirebaseDataSource(db: FirebaseFirestore.instance)) {
    _notificationManager.handleData = save;
  }

  Future<void> setupNotifications() async {
    await _notificationManager.setupNotifications();
  }

  Future<void> initNotifications() async {
    await _notificationManager.initNotifications();
  }

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
