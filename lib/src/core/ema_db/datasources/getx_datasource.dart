import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/local_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

class GetxDataSource extends LocalDataSource {
  final GetStorage db;

  GetxDataSource({required this.db});

  /// Saves an [EMAModel] to the local storage.
  ///
  /// The [EMAModel] is converted to a JSON object and saved to the local storage.
  /// It can later be retrieved using the path provided.
  @override
  Future<void> saveEMAModel({
    required EMAModel emaModel,
    required String path,
  }) async {
    db.write(path, emaModel.toJson());
  }

  /// Fetches the data from the [path].
  @override
  Future<Map<String, dynamic>?> getDataModel({required String path}) async {
    final Map<String, dynamic>? data = db.read(path);
    return data;
  }
}
