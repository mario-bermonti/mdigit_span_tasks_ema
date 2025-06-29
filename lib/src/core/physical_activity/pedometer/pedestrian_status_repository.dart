import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/pedestrian_status/models/pedestrian_status.dart'
    as ema_db;
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/pedestrian_status/models/pedestrian_status_model.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/pedestrian_status/pedestrian_status_repository.dart'
    as ema_db;
import 'package:pedometer/pedometer.dart';

class PedestrianStatusRepository {
  final String _participantId;
  final ema_db.PedestrianStatusRepository _repo;

  PedestrianStatusRepository({
    required String participantId,
    required ema_db.PedestrianStatusRepository repo,
  })  : _participantId = participantId,
        _repo = repo;

  PedestrianStatusRepository.init({required String participantId})
      : _participantId = participantId,
        _repo = ema_db.PedestrianStatusRepository(
          remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
        );

  /// Saves [pedestrianStatus] to the remote database.
  Future<void> save(PedestrianStatus pedestrianStatus) async {
    final String pathRemoteDB =
        'physical_activity/$_participantId/pedestrian_status';
    final PedestrianStatusModel pedestrianStatusModel = PedestrianStatusModel(
      participantId: _participantId,
      status: pedometerToEmaDBStatus(pedestrianStatus.status),
      timestamp: pedestrianStatus.timeStamp,
    );

    await _repo.save(
      pedestrianStatus: pedestrianStatusModel,
      pathRemoteDB: pathRemoteDB,
    );
  }

  /// Converts [pedometer]'s to [ema_db]'s pedestrian status.
  ema_db.PedestrianStatus pedometerToEmaDBStatus(String status) {
    switch (status) {
      case 'walking':
        return ema_db.PedestrianStatus.walking;
      case 'stopped':
        return ema_db.PedestrianStatus.stopped;
      case 'unknown':
      default:
        return ema_db.PedestrianStatus.unknown;
    }
  }
}
