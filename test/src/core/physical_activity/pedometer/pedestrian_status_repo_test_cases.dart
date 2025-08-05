import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mockito/mockito.dart';
import 'package:pedometer/pedometer.dart' as pedometer;

final DateTime now = DateTime.now();

class PedestrianStatus extends Fake implements pedometer.PedestrianStatus {
  @override
  String get status => 'walking';

  @override
  DateTime get timeStamp => now;
}

final PedestrianStatus testPedestrianStatus = PedestrianStatus();
const String participantId = 'testParticipant';

final ContinuousSensorModel expected = ContinuousSensorModel(
    participantId: participantId,
    value: testPedestrianStatus.status,
    timestamp: now);

const String testPathRemoteDB =
    'physical_activity/$participantId/pedestrian_status';
