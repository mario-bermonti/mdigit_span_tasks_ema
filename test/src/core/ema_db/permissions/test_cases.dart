import 'package:mdigits/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigits/src/core/ema_db/permissions/models/status.dart';

final Permission testPermission = Permission(
  participantId: 'testParticipant',
  permissionId: 'testPermission',
  dateTimeChanged: DateTime.now(),
  status: Status.accepted,
  permissionDescription: 'Test permission description',
);

final Permission testPermission2 = Permission(
  participantId: 'testParticipant',
  permissionId: 'testPermission2',
  dateTimeChanged: DateTime.now(),
  status: Status.accepted,
  permissionDescription: 'Test permission description',
);

final Permission testPermission3 = Permission(
  participantId: 'testParticipant',
  permissionId: 'testLatestPermission',
  dateTimeChanged: DateTime.now(),
  status: Status.accepted,
  permissionDescription: 'Test permission description',
);

String testPathRemoteDB =
    'permissions/${testPermission.participantId}/${testPermission.permissionId}';

String testPathLocalDB = 'permissions';
