import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/continuous_sensor_repository.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/physical_activity/pedometer/pedestrian_status_repository.dart';

import 'pedestrian_status_repo_test_cases.dart';

void main() {
  late FakeFirebaseFirestore remoteDB;
  late PedestrianStatusRepository repository;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();

      remoteDB = FakeFirebaseFirestore();
      final FirebaseDataSource remoteDataSource =
          FirebaseDataSource(db: remoteDB);
      final ContinuousSensorRepository continuousSensorRepository =
          ContinuousSensorRepository(remoteDataSource: remoteDataSource);

      repository = PedestrianStatusRepository(
        participantId: participantId,
        repo: continuousSensorRepository,
      );
    },
  );

  tearDown(() {
    remoteDB.clearPersistence();
  });

  group(
    "PedestrianStatusRepository.save",
    () {
      test(
        "Given a pedometer's package [PedestrianStatus], saves the data to the "
        "remote db.",
        () async {
          await repository.save(testPedestrianStatus);

          final QuerySnapshot<Map<String, dynamic>> snapshot =
              await remoteDB.collection(testPathRemoteDB).get();

          final ContinuousSensorModel actual =
              ContinuousSensorModel.fromJson(snapshot.docs.first.data());

          expect(actual, expected);
        },
      );
    },
  );
}
