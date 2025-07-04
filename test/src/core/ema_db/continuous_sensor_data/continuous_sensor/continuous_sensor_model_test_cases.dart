import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';

final ContinuousSensorModel testContinuousSensorModel = ContinuousSensorModel(
  participantId: 'testParticipant',
  timestamp: DateTime.now(),
  value: 'testData',
);

final String testPathRemoteDB =
    'continuous_sensors/${testContinuousSensorModel.participantId}/continuous_sensors';
