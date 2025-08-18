import 'package:get/get.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/participant/app_service.dart';
import 'package:mdigits/src/core/participant/location_services.dart';
import 'package:mdigits/src/core/participant/participant_service.dart';
import 'package:mdigits/src/device/device_service.dart';
import 'package:mdigits/src/notifications/data/notifications_manager_service.dart';
import 'package:mdigits/src/notifications/data/notifications_permission_repository_service.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';

import '../../auth/participant.dart';

class PostConsentSetupService {
  final Participant _participant = Get.find<Participant>();
  final DateTime _completionTime;
  late final NotificationsManagerService _notificationsManagerService;

  PostConsentSetupService({required DateTime completionTime})
      : _completionTime = completionTime {
    _notificationsManagerService =
        NotificationsManagerService.init(participantId: _participant.id);
  }

  Future<void> runAllSetup() async {
    await setupNotifications();
    await saveNotificationsPermissions();
    await saveParticipantMetadata();
    await saveDeviceMetadata();
  }

  Future<void> setupNotifications() async {
    await _notificationsManagerService.setupNotifications();

    final StudyProgressStep notificationStep = StudyProgressStep(
      participantId: _participant.id,
      stepId: "notificationStep",
      completionDateTime: _completionTime,
      stepDescription:
          "Step where participants indicate whether they accept to receive notifications.",
      lastUpdatedDateTime: _completionTime,
      status: Status.completed,
    );

    final StudyProgressService studyProgressService =
        StudyProgressService.init();
    await studyProgressService.save(progressStep: notificationStep);
  }

  Future<void> saveNotificationsPermissions() async {
    final NotificationsPermissionRepositoryService
        notificationsPermissionService =
        NotificationsPermissionRepositoryService.init(
            participantId: _participant.id);
    await notificationsPermissionService.save(
        areAccepted:
            await _notificationsManagerService.areNotificationsEnabled());
  }

  Future<void> saveParticipantMetadata() async {
    final LocationService locationService = LocationService();
    final AppService appService = await AppService.init();
    ema_participant.Participant emaParticipant = ema_participant.Participant(
      id: _participant.id,
      locale: locationService.locale,
      timezone: locationService.timezone,
      appVersion: appService.appVersion,
      appBuildNumber: appService.appBuildNumber,
    );

    final String? token = await _notificationsManagerService.getToken();
    if (token != null) {
      emaParticipant = emaParticipant.copyWith(
        notificationTokens: [token],
      );
    }

    final ParticipantService participantService = ParticipantService.init();
    participantService.save(participant: emaParticipant);
  }

  Future<void> saveDeviceMetadata() async {
    final DeviceService deviceService =
        DeviceService.init(participantId: _participant.id);
    deviceService.saveData();
  }
}
