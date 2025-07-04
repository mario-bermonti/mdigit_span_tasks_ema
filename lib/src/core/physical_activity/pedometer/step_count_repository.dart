import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/continuous_sensor_repository.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:pedometer/pedometer.dart';

class StepCountRepository {
  final String _participantId;
  final ContinuousSensorRepository _repo;

  StepCountRepository({
    required String participantId,
    required ContinuousSensorRepository repo,
  })  : _participantId = participantId,
        _repo = repo;

  StepCountRepository.init({required String participantId})
      : _participantId = participantId,
        _repo = ContinuousSensorRepository(
          remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
        );

  /// Saves [stepCount] to the remote database.
  ///
  /// [stepCount] is produced by the [pedometer] plugin, so we just
  /// need to process it.
  Future<void> save(StepCount stepCount) async {
    final String pathRemoteDB = 'physical_activity/$_participantId/step_count';

    final ContinuousSensorModel continuousSensorData = ContinuousSensorModel(
      participantId: _participantId,
      value: stepCount.steps.toString(),
      timestamp: stepCount.timeStamp,
    );

    await _repo.save(
      continuousSensorData: continuousSensorData,
      pathRemoteDB: pathRemoteDB,
    );
  }
}
