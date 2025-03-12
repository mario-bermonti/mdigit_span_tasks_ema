import 'package:mdigit_span_tasks_ema/src/core/ema_db/device/models/device.dart';

const Device testDevice = Device(
  participantId: 'testParticipant',
  deviceId: 'testDevice',
  deviceModel: 'testModel',
  os: 'testOs',
  osVersion: 'testOsVersion',
  height: 'testHeight',
  width: 'testWidth',
  aspectRatio: 'testAspectRatio',
);

final String testPathRemoteDB =
    'devices/participants/${testDevice.participantId}';
