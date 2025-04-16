import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/status.dart';

final Permission testPermission = Permission(
  participantId: 'testParticipantId',
  permissionId: 'notifications',
  permissionDescription: 'Notifications permission',
  dateTimeChanged: DateTime.now(),
  status: Status.accepted,
);

final String testPathRemoteDB =
    'permissions/${testPermission.participantId}/${testPermission.permissionId}';

const String testPathLocalDB = 'notificationsPermissions';
