import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/pedestrian_status/models/pedestrian_status_model.dart';
import 'package:mdigits/src/core/ema_db/pedestrian_status/pedestrian_status_repository.dart';

import 'pedestrian_status_model_test_cases.dart';

void main() {
  late PedestrianStatusRepository repository;
  late FirebaseFirestore remoteDB;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    remoteDB = FakeFirebaseFirestore();
    FirebaseDataSource dataSource = FirebaseDataSource(db: remoteDB);
    repository = PedestrianStatusRepository(remoteDataSource: dataSource);
  });

  tearDown(() {
    remoteDB.clearPersistence();
  });

  group('PedestrianStatusRepository.save', () {
    test(
      "Given a [PedestrianStatusModel], [pathRemoteDB], saves the data to the "
      "remote db.",
      () async {
        await repository.save(
          pedestrianStatus: testPedestrianStatusModel,
          pathRemoteDB: testPathRemoteDB,
        );

        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await remoteDB.collection(testPathRemoteDB).get();
        final PedestrianStatusModel actualPedestrianStatusModel =
            PedestrianStatusModel.fromJson(snapshot.docs.first.data());

        expect(actualPedestrianStatusModel, testPedestrianStatusModel);
      },
    );
  });
}
