import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/continuous_sensor_repository.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/pedestrian_status/models/pedestrian_status.dart'
    as ema_db;
import 'package:pedometer/pedometer.dart';

class PedestrianStatusRepository {
  final String _participantId;
  final ContinuousSensorRepository _repo;

  PedestrianStatusRepository({
    required String participantId,
    required ContinuousSensorRepository repo,
  })  : _participantId = participantId,
        _repo = repo;

  PedestrianStatusRepository.init({required String participantId})
      : _participantId = participantId,
        _repo = ContinuousSensorRepository(
          remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
        );

  /// Saves [pedestrianStatus] to the remote database.
  ///
  /// [pedestrianStatus] is produced by the [pedometer] plugin, so we just
  /// need to process it.
  Future<void> save(PedestrianStatus pedestrianStatus) async {
    final String pathRemoteDB =
        'physical_activity/$_participantId/pedestrian_status';

    final ContinuousSensorModel continuousSensorData = ContinuousSensorModel(
      participantId: _participantId,
      value: pedometerToEmaDBStatus(pedestrianStatus.status).name,
      timestamp: pedestrianStatus.timeStamp,
    );

    await _repo.save(
      continuousSensorData: continuousSensorData,
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
