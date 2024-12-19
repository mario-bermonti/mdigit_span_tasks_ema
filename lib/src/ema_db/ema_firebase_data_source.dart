import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/metadata/metadata.dart';

/// Data source that interacts with Firebase db.
class FirebaseDataSource {
  final FirebaseFirestore db;

  FirebaseDataSource({required this.db});

  /// Add metadata about the task.
  Future<void> saveTaskMetadata({
    required Metadata metadata,
    required CollectionReference collectionRef,
  }) {
    // TODO: implement saveMetadata
    throw UnimplementedError();
  }

  /// Add data about task items.
  Future<void> saveTaskItem() {
    // TODO: implement saveItemData
    throw UnimplementedError();
  }
}
