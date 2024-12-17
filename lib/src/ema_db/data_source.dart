/// Provides an interface that standardizes data sources.
abstract class DataSource {
  Future<void> saveTaskMetadata();
  Future<void> saveTaskItem();
}
