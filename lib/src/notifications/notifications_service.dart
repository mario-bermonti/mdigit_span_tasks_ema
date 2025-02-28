import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/notification_repository.dart';
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
}
