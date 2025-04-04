import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/models/notification.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/notifications/notification_repository.dart';

import '../../../ema_db/test_data/notification.dart';

void main() {
  late FirebaseDataSource firebaseDataSource;
  late NotificationRepository repository;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
      repository = NotificationRepository(
        remoteDataSource: firebaseDataSource,
      );
    },
  );
  tearDown(() async {
    await firebaseDataSource.db.clearPersistence();
  });
  group('ParticipantRepository.save', () {
    test(
        "Given a [Notification], [pathRemoteDB], saves the data to "
        "the remote db.", () async {
      await repository.save(
        notification: testNotification,
        pathRemoteDB: testPathRemoteDB,
      );

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firebaseDataSource.db.collection(testPathRemoteDB).get();
      final Notification actualNotification =
          Notification.fromJson(snapshot.docs.first.data());

      expect(actualNotification, testNotification);
    });
  });
}
