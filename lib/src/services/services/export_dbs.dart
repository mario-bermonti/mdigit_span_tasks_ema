import 'package:mdigit_span_tasks_ema/src/export_data/controller/data_exporter.dart';

/// Export dbs to make them accessible to users
Future<void> exportDBs() async {
  await _exportDB(taskName: 'ds_forward.sqlite3');
  await _exportDB(taskName: 'ds_backwards.sqlite3');
}

/// Export the db specified in [taskName]
Future<void> _exportDB({required String taskName}) async {
  DataExporter dataExporter = DataExporter(taskName: taskName);
  await dataExporter.requestPermission();
  await dataExporter.getDB();
  await dataExporter.initDestinationFile();
  await dataExporter.copyDB();
}
