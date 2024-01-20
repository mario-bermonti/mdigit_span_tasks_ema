import 'package:mdigit_span_tasks/src/export_data/controller/data_exporter.dart';

/// Export dbs to make them accesible by users
Future<void> exportDBs() async {}

/// Export the db specified in [dbName]
Future<void> _exportDB({required String dbName}) async {
  DataExporter dataExporter = DataExporter(dbName: dbName);
  dataExporter.requestPermission();
  await dataExporter.getDB();
  await dataExporter.initDestinationFile();
}
