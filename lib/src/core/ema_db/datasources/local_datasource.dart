import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

/// Declares the contract that all local data sources must implement.
abstract class LocalDataSource {
  /// Saves [EMAModel] to the data source.
  Future<void> saveEMAModel({
    required EMAModel emaModel,
    required String path,
  });
}