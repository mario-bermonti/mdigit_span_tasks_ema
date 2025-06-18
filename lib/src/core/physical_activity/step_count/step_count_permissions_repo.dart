import 'package:mdigits/src/core/ema_db/permissions/models/permission.dart';
import 'package:mdigits/src/core/ema_db/permissions/models/status.dart';
import 'package:mdigits/src/core/permissions/permissions_repository.dart';
import 'package:mdigits/src/core/physical_activity/step_count/step_count_datasource.dart';

class StepCountPermissionsRepo {
  final StepCountDataSource _datasource;
  final String _participantId;
  final PermissionRepository _permissionRepo;

  StepCountPermissionsRepo({
    required StepCountDataSource dataSource,
    required String participantId,
    required PermissionRepository permissionRepository,
  })  : _datasource = dataSource,
        _participantId = participantId,
        _permissionRepo = permissionRepository;

  StepCountPermissionsRepo.init({
    required StepCountDataSource dataSource,
    required String participantId,
  })  : _datasource = dataSource,
        _participantId = participantId,
        _permissionRepo =
            PermissionRepository.init(participantId: participantId);

  Future<void> savePermissionsToDB() async {
    final bool granted = _datasource.permissionGranted;

    final Permission permission = Permission(
      participantId: _participantId,
      permissionId: 'step_count',
      permissionDescription: 'Permission to access step count data',
      dateTimeChanged: DateTime.now(),
      status: granted ? Status.accepted : Status.denied,
    );

    await _permissionRepo.saveIfChanged(permission: permission);
  }
}
