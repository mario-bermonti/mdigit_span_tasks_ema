import 'package:get/get.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/participant/participant_service.dart';
import 'package:mdigits/src/notifications/data/notifications_manager_service.dart';
import 'package:mdigits/src/notifications/data/notifications_permission_repository_service.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';

class NotificationsInitService {
  final Participant _participant = Get.find<Participant>();
  final StudyProgressService _studyProgressService =
      StudyProgressService.init();
  late final NotificationsManagerService _notificationsManagerService;
  final ParticipantService _participantService = ParticipantService.init();

  Future<void> setupNotifications({required DateTime completionDate}) async {
    await _notificationsManagerService.setupNotifications();

    final StudyProgressStep notificationStep = StudyProgressStep(
      participantId: _participant.id,
      stepId: "notificationStep",
      completionDateTime: completionDate,
      stepDescription:
          "Step where participants indicate whether they accept to receive notifications.",
      lastUpdatedDateTime: completionDate,
      status: Status.completed,
    );

    await _studyProgressService.save(progressStep: notificationStep);
  }

  Future<void> initNotifications() async {
    await _notificationsManagerService.initNotifications();
  }

  Future<void> initNotificationsIfConsented() async {
    _notificationsManagerService =
        NotificationsManagerService.init(participantId: _participant.id);

    final StudyProgressStep? consentStep = await _studyProgressService.get(
      participantId: _participant.id,
      stepId: 'consentStep',
    );
    if (consentStep?.status == Status.completed) {
      await _notificationsManagerService.initNotifications();
      final String? token = await _notificationsManagerService.getToken();
      if (token != null) {
        final ema_participant.Participant emaParticipant =
            ema_participant.Participant(
          id: _participant.id,
          notificationTokens: [token],
        );

        _participantService.save(participant: emaParticipant);
      }
    }
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

  Future<void> updateNotificationsPermissions() async {
    final NotificationsPermissionRepositoryService
        notificationsPermissionRepositoryService =
        NotificationsPermissionRepositoryService.init(
            participantId: _participant.id);

    final bool areAccepted =
        await _notificationsManagerService.areNotificationsEnabled();
    notificationsPermissionRepositoryService.updateIfNecessary(
        areAccepted: areAccepted);
  }

  Future<String?> getToken() async {
    return await _notificationsManagerService.getToken();
  }
}
