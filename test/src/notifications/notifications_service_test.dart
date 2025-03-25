import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/models/notification.dart'
    as ema_db;
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/notification_repository.dart';
import 'package:mdigit_span_tasks_ema/src/core/notifications/notifications_manager.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_service.dart';

import 'test_data.dart';

class NotificationsManagerMock extends Fake implements NotificationsManager {}

void main() {
  late NotificationsManagerMock notificationsManager;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late NotificationService notificationService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    notificationsManager = NotificationsManagerMock();
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    NotificationRepository repo = NotificationRepository(
        remoteDataSource: FirebaseDataSource(db: fakeFirebaseFirestore));
    notificationService = NotificationService(
        notificationManager: notificationsManager,
        participantId: participantId,
        notificationRepository: repo);
  });

  tearDown(() async {
    await fakeFirebaseFirestore.clearPersistence();
  });

  group("NotificationService.save", () {
    test(
      "Given a notification handler's [Notification], "
      "saves a [ema_db]'s [Notification] to the remote db.",
      () async {
        await notificationService.save(notification: testHandlerNotification);

        final QuerySnapshot<
            Map<String,
                dynamic>> notificationsSnapshot = await fakeFirebaseFirestore
            .collection(
                'notifications/$participantId/${testHandlerNotification.notificationId}')
            .get();

        final ema_db.Notification actualNotification =
            ema_db.Notification.fromJson(
                notificationsSnapshot.docs.first.data());

        expect(actualNotification, testEmadbNotification);
      },
    );
  });
}
