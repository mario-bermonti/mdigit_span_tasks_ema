import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

/// Provides data on step count and pedestrian status.
class StepCounterDataSource {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  /// Streams the step count data in real time.
  Stream<StepCount> get stepCountStream => _stepCountStream;

  Stream<PedestrianStatus> get pedestrianStatusStream =>
      _pedestrianStatusStream;

  /// Asks permission and initializes the step counter.
  Future<void> init() async {
    await _askPermission();
    _stepCountStream = Pedometer.stepCountStream;
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
  }

  /// Asks the user for permission to access activity recognition, if it
  /// has not been granted.
  Future<void> _askPermission() async {
    final bool granted =
        await Permission.activityRecognition.request().isGranted;
    if (!granted) {
      throw Exception("Activity recognition permission not granted");
    }
  }
}
