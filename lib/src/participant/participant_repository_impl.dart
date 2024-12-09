import 'package:mdigit_span_tasks_ema/src/participant/participant_repository.dart';

import '../ema_data/ema_data.dart';
import 'participant_model.dart';

/// A repository for saving participant data to the dbs.
///
/// [dataManager] handles db operations.
class ParticipantRepositoryImpl implements ParticipantRepository {
  final EMAData dataManager;

  ParticipantRepositoryImpl({required this.dataManager});

  /// Saves the participant data to the db.
  @override
  Future<void> saveParticipant({required ParticipantModel participant}) async {}
}
