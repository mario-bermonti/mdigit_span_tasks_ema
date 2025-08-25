import 'package:mdigits/src/core/setup/auth_setup_service.dart';
import 'package:mdigits/src/core/setup/global_services_setup_service.dart';
import 'package:mdigits/src/core/setup/notifications_init_service.dart';
import 'package:mdigits/src/core/setup/participant_setup_service.dart';
import 'package:mdigits/src/core/setup/passive_sensing_setup_service.dart';

class AppSetupService {
  final NotificationsInitService _notificationsInitService =
      NotificationsInitService();
  final PassiveSensingSetupService _passiveSensingSetupService =
      PassiveSensingSetupService();
  final ParticipantSetupService _participantSetupService =
      ParticipantSetupService();

  Future<void> initOnLaunch() async {
    await GlobalServicesSetupService().initGlobalServices();
    await AuthSetupService().initAuth();
    await _participantSetupService.saveAppFirstLaunch();
    await _notificationsInitService.initNotificationsIfConsented();
    await _notificationsInitService.updateNotificationsPermissions();
    await PassiveSensingSetupService().initPedometerService();
  }

  Future<void> initOnConsent({required DateTime completionDate}) async {
    await _notificationsInitService.setupNotifications(
        completionDate: completionDate);
    await _notificationsInitService.saveNotificationsPermissions();
    _notificationsInitService.initNotifications();
    await _participantSetupService.saveParticipantMetadata(
        notificationsInitService: _notificationsInitService);
    await _participantSetupService.saveDeviceMetadata();
    await _passiveSensingSetupService.initPedometerService();
  }
}
