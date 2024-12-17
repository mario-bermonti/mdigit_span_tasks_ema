import 'data_source.dart';

/// Data source that interacts with Firebase db.
class FirebaseDataSource implements DataSource {
  /// Add metadata about the task.
  @override
  Future<void> saveTaskMetadata() {
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
