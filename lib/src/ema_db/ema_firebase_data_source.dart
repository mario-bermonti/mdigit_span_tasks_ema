import 'data_source.dart';
import 'models/metadata/metadata.dart';

/// Data source that interacts with Firebase db.
class FirebaseDataSource implements DataSource {
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
