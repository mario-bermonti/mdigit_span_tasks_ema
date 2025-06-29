import 'package:mdigits/src/core/ema_db/continuous_sensor_data/pedestrian_status/models/pedestrian_status_model.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/pedestrian_status/models/pedestrian_status.dart';

final PedestrianStatusModel testPedestrianStatusModel = PedestrianStatusModel(
  participantId: 'testParticipant',
  status: PedestrianStatus.walking,
  timestamp: DateTime.now(),
);

final String testPathRemoteDB =
    'physical_activity/${testPedestrianStatusModel.participantId}/pedestrian_status';
