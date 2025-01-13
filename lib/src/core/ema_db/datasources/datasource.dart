import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

/// Base class for data sources.
///
/// All data sources must implement this class to guarantee standardization.
abstract class DataSource {
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
}
