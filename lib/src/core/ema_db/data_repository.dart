import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

abstract class DataRepository {
  Future<void> save({
    required EMAModel emaModel,
    required String path,
  });
}
