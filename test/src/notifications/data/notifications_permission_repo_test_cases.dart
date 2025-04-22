import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/status.dart';

final Permission testAcceptedPermission = Permission(
  participantId: 'testParticipantId',
  permissionId: 'notifications',
  permissionDescription: 'Notifications permission',
  dateTimeChanged: DateTime.now(),
  status: Status.accepted,
);

final Permission testDeniedPermission = Permission(
  participantId: 'testParticipantId',
  permissionId: 'notifications',
  permissionDescription: 'Notifications permission',
  dateTimeChanged: DateTime.now(),
  status: Status.denied,
);

final String testPathRemoteDB =
    'permissions/${testAcceptedPermission.participantId}/${testAcceptedPermission.permissionId}';

const String testPathLocalDB = 'notificationsPermissions';
