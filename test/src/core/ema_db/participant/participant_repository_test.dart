import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/participant_repository.dart';

void main() {
  late RemoteDataSource firebaseDataSource;
  late ParticipantRepository repository;

  setUp(
    () {
      firebaseDataSource = FirebaseDataSource(db: FakeFirebaseFirestore());
      repository = ParticipantRepository(
        remoteDataSource: firebaseDataSource,
      );
    },
  );
}
