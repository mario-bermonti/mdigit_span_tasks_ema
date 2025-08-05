import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/grouped_continuous_sensor_model.dart';

final ContinuousSensorModel testContinuousSensorModel1 = ContinuousSensorModel(
  participantId: 'testParticipant',
  timestamp: DateTime.now(),
  value: 'testData1',
);

final ContinuousSensorModel testContinuousSensorModel2 = ContinuousSensorModel(
  participantId: 'testParticipant',
  timestamp: DateTime.now(),
  value: 'testData2',
);

final String testPathRemoteContinuousDB =
    'continuous_sensors/${testContinuousSensorModel1.participantId}/continuous_sensors';

final GroupedContinuousSensorData expectedGrouped = GroupedContinuousSensorData(
  participantId: testContinuousSensorModel1.participantId,
  periodStart: testContinuousSensorModel1.timestamp,
  periodEnd: testContinuousSensorModel2.timestamp,
  sensorData: [testContinuousSensorModel1, testContinuousSensorModel2],
);

final String testPathRemoteGroupedDB =
    'continuous_sensors/${testContinuousSensorModel1.participantId}/grouped_continuous_sensors';
