import 'package:mdigits/src/core/ema_db/continuous_sensor_data/step_count/models/step_count_model.dart';

final StepCountModel testStepCountModel = StepCountModel(
  participantId: 'testParticipant',
  count: 1000,
  timestamp: DateTime.now(),
);

final String testPathRemoteDB =
    'physical_activity/${testStepCountModel.participantId}/step_count';
