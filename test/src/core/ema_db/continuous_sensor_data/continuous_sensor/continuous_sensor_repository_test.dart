import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/continuous_sensor_repository.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/grouped_continuous_sensor_model.dart';
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
          continuousSensorData: testContinuousSensorModel1,
          pathRemoteDB: testPathRemoteContinuousDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteContinuousDB).get();
        final ContinuousSensorModel actualContinuousSensorModel =
            ContinuousSensorModel.fromJson(snapshot.docs.first.data());

        expect(actualContinuousSensorModel, testContinuousSensorModel1);
      },
    );
  });
  group('ContinuousSensorRepository.saveCachedData', () {
    test(
      "Given no cached data, does nothing.",
      () async {
        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteContinuousDB).get();
        final bool actual = snapshot.docs.isEmpty;

        expect(actual, isTrue);
      },
    );
    test(
      "Given cached data, saves the data to the remote db.",
      () async {
        repository.cacheData(continuousSensorData: testContinuousSensorModel1);
        repository.cacheData(continuousSensorData: testContinuousSensorModel2);

        await repository.saveCachedData(
          pathRemoteDB: testPathRemoteGroupedDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteGroupedDB).get();
        final GroupedContinuousSensorData actual =
            GroupedContinuousSensorData.fromJson(snapshot.docs.first.data());

        expect(actual, expectedGrouped);
      },
    );
  });
  group('ContinuousSensorRepository.scheduleSavingCachedData', () {
    test(
      "Given a Duration, saves the data to the remote db periodically after "
      "the duration.",
      () async {
        repository.cacheData(continuousSensorData: testContinuousSensorModel1);
        repository.cacheData(continuousSensorData: testContinuousSensorModel2);
        const Duration interval = Duration(milliseconds: 50);

        repository.scheduleSavingCachedData(
          interval: interval,
          pathRemoteDB: testPathRemoteGroupedDB,
        );

        await Future.delayed(interval);

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteGroupedDB).get();
        final GroupedContinuousSensorData actual =
            GroupedContinuousSensorData.fromJson(snapshot.docs.first.data());

        expect(actual, expectedGrouped);
      },
    );
  });
}
