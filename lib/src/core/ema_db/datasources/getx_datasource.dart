import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/local_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

class GetxDataSource extends LocalDataSource {
  final GetStorage db;

  GetxDataSource({required this.db});

  @override
  Future<void> saveEMAModel({
    required EMAModel emaModel,
    required String path,
  }) async {
    db.write(path, emaModel.toJson());
  }
}
