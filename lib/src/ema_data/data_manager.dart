/// Interface that all data managers must implement
abstract class DataManager {
  Future<void> saveMetadata();
  Future<void> saveItemData();
}
