import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

/// Declares the contract that all remote data sources must implement.
abstract class RemoteDataSource {
  /// Saves [EMAModel] to the data source.
  Future<void> saveEMAModel({
    required EMAModel emaModel,
    required String path,
  });

  /// Saves a list of [EMAModel]s to the data source.
  Future<void> saveEMAModels({
    required List<EMAModel> emaModels,
    required String path,
  });

  Future<Map<String, dynamic>?> getDataModel({required String path});
}
