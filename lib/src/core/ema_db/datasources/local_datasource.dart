import 'package:mdigits/src/core/ema_db/models/ema_model.dart';

/// Declares the contract that all local data sources must implement.
abstract class LocalDataSource {
  /// Saves [EMAModel] to the data source.
  Future<void> saveEMAModel({
    required EMAModel emaModel,
    required String path,
  });

  /// Fetches [EMAModel] from the data source.
  Future<Map<String, dynamic>?> getDataModel({required String path});
}
