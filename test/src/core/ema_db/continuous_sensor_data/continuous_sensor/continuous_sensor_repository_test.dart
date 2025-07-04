import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/continuous_sensor_repository.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';

import 'continuous_sensor_model_test_cases.dart';

void main() {
  late ContinuousSensorRepository repository;
  late FirebaseFirestore remoteDB;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    remoteDB = FakeFirebaseFirestore();
    FirebaseDataSource dataSource = FirebaseDataSource(db: remoteDB);
    repository = ContinuousSensorRepository(remoteDataSource: dataSource);
  });

  tearDown(() {
    remoteDB.clearPersistence();
  });

  group('ContinuousSensorRepository.save', () {
    test(
      "Given a [ContinuousSensorModel], [pathRemoteDB], saves the data to the "
      "remote db.",
      () async {
        await repository.save(
          continuousSensorData: testContinuousSensorModel,
          pathRemoteDB: testPathRemoteDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        final ContinuousSensorModel actualContinuousSensorModel =
            ContinuousSensorModel.fromJson(snapshot.docs.first.data());

        expect(actualContinuousSensorModel, testContinuousSensorModel);
      },
    );
  });
}
