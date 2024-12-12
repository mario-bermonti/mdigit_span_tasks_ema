/// Interface that all data managers must implement
abstract class DataSource {
  Future<void> saveMetadata();
  Future<void> saveItemData();
}
