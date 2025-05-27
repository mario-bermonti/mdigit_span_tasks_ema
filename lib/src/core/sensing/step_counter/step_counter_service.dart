import 'package:get/get.dart';
import 'package:mdigits/src/core/sensing/step_counter/step_counter_datasource.dart';
import 'package:pedometer/pedometer.dart';

/// Service that collects and uploads to db real-time data on step count.
class StepCounterService extends GetxService {
  final StepCounterDataSource _dataSource;

  StepCounterService({required StepCounterDataSource dataSource})
      : _dataSource = dataSource;

  /// Streams the step count data in real time.
  Stream<StepCount> get stepCountStream => _dataSource.stepCountStream;

  Stream<PedestrianStatus> get pedestrianStatusStream =>
      _dataSource.pedestrianStatusStream;

  static Future<StepCounterService> init() async {
    final StepCounterDataSource dataSource = StepCounterDataSource();
    await dataSource.init();
    return StepCounterService(dataSource: dataSource);
  }
}
