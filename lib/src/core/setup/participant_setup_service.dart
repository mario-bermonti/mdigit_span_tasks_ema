import 'package:get/get.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/participant/app_service.dart';
import 'package:mdigits/src/core/participant/location_services.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigits/src/core/participant/participant_service.dart';
import 'package:mdigits/src/core/setup/notifications_init_service.dart';
import 'package:mdigits/src/device/device_service.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';

class ParticipantSetupService {
  final Participant _participant = Get.find<Participant>();

  Future<void> saveParticipantMetadata({
    required NotificationsInitService notificationsInitService,
  }) async {
    final LocationService locationService = LocationService();
    final AppService appService = await AppService.init();
    ema_participant.Participant emaParticipant = ema_participant.Participant(
      id: _participant.id,
      locale: locationService.locale,
      timezone: locationService.timezone,
      appVersion: appService.appVersion,
      appBuildNumber: appService.appBuildNumber,
    );

    final String? token = await notificationsInitService.getToken();
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

  Future<void> saveAppFirstLaunch() async {
    final StudyProgressService studyProgressService =
        StudyProgressService.init();
    studyProgressService.saveFirstAppLaunch(participantId: _participant.id);
  }
}
