import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/notifications/notifications_manager.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/data/notifications_repository_service.dart';

/// Provides an interface to manage/handle notifications.
///
/// It wraps [NotificationsManager] functionality.
class NotificationsManagerService extends GetxController {
  final NotificationsManager _notificationsManager;

  /// Returns the token used to send remote notifications to user.
  Future<String?> getToken() async => await _notificationsManager.getToken();

  Future<bool> areNotificationsEnabled() async {
    return await _notificationsManager.areNotificationsEnabled();
  }

  RemoteMessage? get notificationWhileOnTerminated =>
      _notificationsManager.notificationWhileOnTerminated;

  NotificationsManagerService({
    required NotificationsManager notificationManager,
  }) : _notificationsManager = notificationManager;

  NotificationsManagerService.init({required String participantId})
      : _notificationsManager = NotificationsManager() {
    final NotificationsRepositoryService notificationsRepository =
        NotificationsRepositoryService.init(participantId: participantId);
    _notificationsManager.handleData = notificationsRepository.save;
  }

  Future<void> setupNotifications() async {
    await _notificationsManager.setupNotifications();
  }

  Future<void> initNotifications() async {
    await _notificationsManager.initNotifications();
  }
}
