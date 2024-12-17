import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_source.dart';
import 'models/metadata/metadata.dart';

/// Data source that interacts with Firebase db.
class FirebaseDataSource implements DataSource {
  final FirebaseFirestore db;

  FirebaseDataSource({required this.db});

  /// Add metadata about the task.
  @override
  Future<void> saveTaskMetadata({required Metadata metadata}) {
    // TODO: implement saveMetadata
    throw UnimplementedError();
  }

  /// Add data about task items.
  @override
  Future<void> saveTaskItem() {
    // TODO: implement saveItemData
    throw UnimplementedError();
  }
}
