import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/ema_firebase_data_source.dart';

void main() {
  late FirebaseDataSource db;

  setUp(() {
    db = FirebaseDataSource(db: FakeFirebaseFirestore());
  });
}
