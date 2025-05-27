import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class PedometerService {
  late Stream<StepCount> _stepCountStream;

  Stream<StepCount> get stepCountStream => _stepCountStream;

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

  Future<void> _askPermission() async {
    final bool granted =
        await Permission.activityRecognition.request().isGranted;
    if (!granted) {
      throw Exception("Activity recognition permission not granted");
    }
  }

  void onStepCount(StepCount event) {
    print("Steps: $event");
  }
}
