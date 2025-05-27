import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

/// Pedometer service that provides step count data in real time.
class PedometerService {
  late Stream<StepCount> _stepCountStream;

  /// Streams the step count data in real time.
  Stream<StepCount> get stepCountStream => _stepCountStream;

  /// Asks permission and initializes the pedometer service.
  Future<void> init() async {
    await _askPermission();
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(
      (event) {
        onStepCount(event);
      },
      onError: (object, stackTrace) {
        onError(object, stackTrace);
      },
    );
  }

  /// Handles errors that occur while collecting step count data.
  void onError(object, stackTrace) {
    print("Error collecting step count data");
    print(object);
    print(stackTrace);
  }

  /// Asks the user for permission to access activity recognition, if it
  /// has not been granted.
  Future<void> _askPermission() async {
    final bool granted =
        await Permission.activityRecognition.request().isGranted;
    if (!granted) {
      // throw Exception("Activity recognition permission not granted");
      print("Error requesting activity recognition permission");
    }
  }

  /// Handles the step count events.
  void onStepCount(StepCount event) {
    print("Steps: $event");
  }
}
