import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigit_span_tasks_ema/src/core/device_metadata/device_metadata.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/device/device_respository.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/device/models/device.dart';
import 'package:uuid/uuid.dart';

/// Service that handles the device's metadata.
///
/// It wraps the [DeviceMetadata] utility and data repository to manage the metadata.
class DeviceService {
  final String _participantId;
  final DeviceMetadata _device;
  final DeviceRepository _deviceRepository;

  DeviceService({
    required String participantId,
    required DeviceMetadata device,
    required DeviceRepository deviceRepository,
  })  : _participantId = participantId,
        _device = device,
        _deviceRepository = deviceRepository;

  /// Constructor that initializes the service with all its dependencies.
  DeviceService.init({required String participantId})
      : _participantId = participantId,
        _device = DeviceMetadata(),
        _deviceRepository = DeviceRepository(
          remoteDataSource: FirebaseDataSource(db: FirebaseFirestore.instance),
        );

  /// Collects and saves the device's metadata to the remote database.
  Future<void> saveData() async {
    final Device device = Device(
      participantId: _participantId,
      deviceId: const Uuid().v4(),
      deviceModel: await _device.model,
      os: _device.os.toString(),
      osVersion: await _device.osVersion,
      height: _device.height.toString(),
      width: _device.width.toString(),
      aspectRatio: _device.aspectRatio.toString(),
    );

    final String pathRemoteDB = 'devices/participants/$_participantId';
    await _deviceRepository.save(
      device: device,
      pathRemoteDB: pathRemoteDB,
    );
  }
}
