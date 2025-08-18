import 'package:get/get.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/physical_activity/pedometer/pedometer_service.dart';
import 'package:mdigits/src/notifications/data/notifications_manager_service.dart';

class DependencyInitService {
  final Participant _participant = Get.find<Participant>();

  Future<void> initAllServices() async {
    await initNotifications();
    await initPedometerService();
  }

  Future<void> initNotifications() async {
    final NotificationsManagerService notificationsManagerService =
        NotificationsManagerService.init(participantId: _participant.id);
    await notificationsManagerService.initNotifications();
  }

  Future<void> initPedometerService() async {
    await Get.putAsync<PedometerService>(() async {
      final PedometerService pedometerService =
          await PedometerService.init(participantId: _participant.id);
      return pedometerService;
    }, permanent: true);
  }
}
