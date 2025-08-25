import 'package:get/get.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/physical_activity/pedometer/pedometer_service.dart';

class PassiveSensingSetupService {
  final Participant _participant = Get.find<Participant>();

  Future<void> initPedometerService() async {
    await Get.putAsync<PedometerService>(() async {
      final PedometerService pedometerService =
          await PedometerService.init(participantId: _participant.id);
      return pedometerService;
    }, permanent: true);
  }
}
