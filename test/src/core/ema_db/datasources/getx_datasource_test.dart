import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/getx_datasource.dart';

import '../../../ema_db/test_data/local_datasource.dart';
import '../../../ema_db/test_data/survey.dart';

void main() {
  late GetxDataSource dataSource;
  late GetStorage db;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    db = GetStorage();
    dataSource = GetxDataSource(db: db);
  });

  group(
    "saveEMAModel",
    () {
      test(
        "Given valid [EMAModel] and [path], saves the [EMAModel] to the db",
        () async {
          await dataSource.saveEMAModel(
            emaModel: expectedSurveyItem,
            path: path,
          );

          final Map<String, dynamic> actualSurveyItem = db.read(path);

          expect(actualSurveyItem, expectedSurveyItem.toJson());
        },
      );
    },
  );
}
