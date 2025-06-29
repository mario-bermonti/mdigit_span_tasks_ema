import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigits/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/step_count/models/step_count_model.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/step_count/step_count_repository.dart'
    as ema_db;
import 'package:pedometer/pedometer.dart';

class StepCountRepository {
  final String _participantId;
  final ema_db.StepCountRepository _repo;

  StepCountRepository({
    required String participantId,
    required ema_db.StepCountRepository repo,
  })  : _participantId = participantId,
        _repo = repo;

  StepCountRepository.init({required String participantId})
      : _participantId = participantId,
        _repo = ema_db.StepCountRepository(
          remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
        );

  /// Saves [stepCount] to the remote database.
  Future<void> save(StepCount stepCount) async {
    final String pathRemoteDB = 'physical_activity/$_participantId/step_count';

    final StepCountModel stepCountModel = StepCountModel(
      participantId: _participantId,
      count: stepCount.steps,
      timestamp: stepCount.timeStamp,
    );

    await _repo.save(
      stepCount: stepCountModel,
      pathRemoteDB: pathRemoteDB,
    );
  }
}
