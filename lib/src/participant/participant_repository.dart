import 'package:mdigit_span_tasks_ema/src/participant/participant_model.dart';

abstract class ParticipantRepository {
  Future<void> saveParticipant({required ParticipantModel participant});
}
