import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mockito/mockito.dart';
import 'package:pedometer/pedometer.dart' as pedometer;

final DateTime now = DateTime.now();

class StepCount extends Fake implements pedometer.StepCount {
  @override
  int get steps => 1000;

  @override
  DateTime get timeStamp => now;
}

final StepCount testStepCount = StepCount();
const String participantId = 'testParticipant';

final ContinuousSensorModel expected = ContinuousSensorModel(
  participantId: participantId,
  value: testStepCount.steps.toString(),
  timestamp: testStepCount.timeStamp,
);

const String testPathRemoteDB = 'physical_activity/$participantId/step_count';
