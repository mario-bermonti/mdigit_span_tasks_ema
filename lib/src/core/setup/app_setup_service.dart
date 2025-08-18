import 'package:get/get.dart';
import 'package:mdigits/src/core/setup/auth_setup_service.dart';
import 'package:mdigits/src/core/setup/global_services_setup_service.dart';
import 'package:mdigits/src/core/setup/notifications_setup_service.dart';
import 'package:mdigits/src/core/setup/participant_setup_service.dart';
import 'package:mdigits/src/core/setup/passive_sensing_setup_service.dart';

class AppSetupService extends GetxService {
  final NotificationsSetupService _notificationsSetupService;
  final PassiveSensingSetupService _passiveSensingSetupService;
  final ParticipantSetupService _participantSetupService;
  final GlobalServicesSetupService _globalServicesSetupService;

  AppSetupService._({
    required NotificationsSetupService notificationsSetupService,
    required PassiveSensingSetupService passiveSensingSetupService,
    required ParticipantSetupService participantSetupService,
    required GlobalServicesSetupService globalServicesSetupService,
  })  : _notificationsSetupService = notificationsSetupService,
        _passiveSensingSetupService = passiveSensingSetupService,
        _participantSetupService = participantSetupService,
        _globalServicesSetupService = globalServicesSetupService;

  static Future<AppSetupService> init() async {
    final GlobalServicesSetupService globalServicesSetupService =
        GlobalServicesSetupService();
    await globalServicesSetupService.initApp();
    await globalServicesSetupService.initDB();
    await AuthSetupService().initAuth();
    final AppSetupService appSetupService = Get.put(
        AppSetupService._(
          notificationsSetupService: NotificationsSetupService(),
          passiveSensingSetupService: PassiveSensingSetupService(),
          participantSetupService: ParticipantSetupService(),
          globalServicesSetupService: globalServicesSetupService,
        ),
        permanent: true);

    return appSetupService;
  }

  Future<void> initOnLaunch() async {
    await _globalServicesSetupService.initCognitiveTasksConfig();
    await _globalServicesSetupService.initNavigatorService();
    await _participantSetupService.saveAppFirstLaunch();
    await _notificationsSetupService.initNotificationsIfConsented();
    await _notificationsSetupService.updateNotificationsPermissions();
    await PassiveSensingSetupService().initPedometerService();
  }

  Future<void> initOnConsent({required DateTime completionDate}) async {
    await _notificationsSetupService.setupNotifications(
        completionDate: completionDate);
    await _notificationsSetupService.saveNotificationsPermissions();
    await _notificationsSetupService.initNotifications();
    await _participantSetupService.saveParticipantMetadata(
        notificationsSetupService: _notificationsSetupService);
    await _participantSetupService.saveDeviceMetadata();
    await _passiveSensingSetupService.initPedometerService();
  }
}
