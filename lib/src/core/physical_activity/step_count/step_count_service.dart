import 'package:get/get.dart';
import 'package:mdigits/src/core/physical_activity/step_count/pedestrian_status_repository.dart';
import 'package:mdigits/src/core/physical_activity/step_count/step_count_permissions_repo.dart';
import 'package:mdigits/src/core/physical_activity/step_count/step_count_repository.dart';
import 'package:mdigits/src/core/physical_activity/step_count/step_count_datasource.dart';
import 'package:pedometer/pedometer.dart';

/// Service that collects and uploads to db real-time data on step count.
class StepCountService extends GetxService {
  final StepCountDataSource _dataSource;

  StepCountService({required StepCountDataSource dataSource})
      : _dataSource = dataSource;

  /// Streams the step count data in real time.
  Stream<StepCount> get stepCountStream => _dataSource.stepCountStream;

  Stream<PedestrianStatus> get pedestrianStatusStream =>
      _dataSource.pedestrianStatusStream;

  static Future<StepCountService> init({required String participantId}) async {
    final StepCountRepository stepCountRepo =
        StepCountRepository.init(participantId: participantId);

    final PedestrianStatusRepository pedestrianStatusRepo =
        PedestrianStatusRepository.init(participantId: participantId);

    final StepCountDataSource dataSource = StepCountDataSource(
        onStepCount: stepCountRepo.save,
        onPedestrianStatus: pedestrianStatusRepo.save,
        onError: _onError);
    await dataSource.init();

    StepCountPermissionsRepo.init(
      dataSource: dataSource,
      participantId: participantId,
    ).savePermissionsToDB();

    return StepCountService(
      dataSource: dataSource,
    );
  }

  /// Handles errors thrown by the data source.
  ///
  /// We are currently not handling the errors because we just want to stop collecting the data if something goes wrong without crashing the app.
  static void _onError(dynamic object, dynamic stackTrace) {}
}
