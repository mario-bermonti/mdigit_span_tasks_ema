import 'models/metadata/metadata.dart';

/// Provides an interface that standardizes data sources.
abstract class DataSource {
  Future<void> saveTaskMetadata({required Metadata metadata});
  Future<void> saveTaskItem();
}
