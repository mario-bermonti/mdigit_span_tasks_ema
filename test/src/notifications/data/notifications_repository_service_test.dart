import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/models/notification.dart'
    as ema_db;
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/notification_repository.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/data/notifications_repository_service.dart';

import 'notifications_repo_test_cases.dart';

void main() {
  late FakeFirebaseFirestore remoteDB;
  late NotificationsRepositoryService service;

  setUp(() {
    remoteDB = FakeFirebaseFirestore();
    FirebaseDataSource remoteDataSource = FirebaseDataSource(db: remoteDB);
    NotificationRepository repo =
        NotificationRepository(remoteDataSource: remoteDataSource);
    service = NotificationsRepositoryService(
      notificationRepository: repo,
      participantId: participantId,
    );
  });
  tearDown(() async {
    await remoteDB.clearPersistence();
  });
  group("NotificationService.save", () {
    test(
      "Given a [Notification] defined in the notification's handlers "
      "(e.g., NotificationsManager), saves a [ema_db]'s [Notification] to the "
      "remote db.",
      () async {
        await service.save(notification: testNotification);

        final QuerySnapshot<
            Map<String,
                dynamic>> notificationsSnapshot = await remoteDB
            .collection(
                'notifications/$participantId/${testNotification.notificationId}')
            .get();

        final ema_db.Notification actualNotification =
            ema_db.Notification.fromJson(
                notificationsSnapshot.docs.first.data());

        expect(actualNotification, testEmaNotification);
      },
    );
  });
}
