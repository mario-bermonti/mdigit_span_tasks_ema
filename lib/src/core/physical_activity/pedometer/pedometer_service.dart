import 'package:get/get.dart';
import 'package:mdigits/src/core/physical_activity/pedometer/pedestrian_status_repository.dart';
import 'package:mdigits/src/core/physical_activity/pedometer/pedometer_permissions_repo.dart';
import 'package:mdigits/src/core/physical_activity/pedometer/step_count_repository.dart';
import 'package:mdigits/src/core/physical_activity/pedometer/pedometer_datasource.dart';
import 'package:pedometer/pedometer.dart';

/// Service that collects and uploads to db real-time data on step count.
class PedometerService extends GetxService {
  final PedometerDataSource _dataSource;

  PedometerService({required PedometerDataSource dataSource})
      : _dataSource = dataSource;

  /// Streams the step count data in real time.
  Stream<StepCount> get stepCountStream => _dataSource.stepCountStream;

  Stream<PedestrianStatus> get pedestrianStatusStream =>
      _dataSource.pedestrianStatusStream;

  static Future<PedometerService> init({required String participantId}) async {
    final StepCountRepository stepCountRepo =
        StepCountRepository.init(participantId: participantId);

    final PedestrianStatusRepository pedestrianStatusRepo =
        PedestrianStatusRepository.init(participantId: participantId);

    final PedometerDataSource dataSource = PedometerDataSource(
        onStepCount: stepCountRepo.cacheData,
        onPedestrianStatus: pedestrianStatusRepo.cacheData,
        onError: _onError);
    await dataSource.init();

    const Duration interval = Duration(minutes: 5);
    stepCountRepo.scheduleSavingCachedData(interval: interval);
    pedestrianStatusRepo.scheduleSavingCachedData(interval: interval);

    PedometerPermissionsRepo.init(
      dataSource: dataSource,
      participantId: participantId,
    ).savePermissionsToDB();

    return PedometerService(
      dataSource: dataSource,
    );
  }

  /// Handles errors thrown by the data source.
  ///
  /// We are currently not handling the errors because we just want to stop collecting the data if something goes wrong without crashing the app.
  static void _onError(dynamic object, dynamic stackTrace) {}
}
