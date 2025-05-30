import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

/// Pedometer service that provides step count data in real time.
class PedometerService extends GetxService {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  /// Streams the step count data in real time.
  Stream<StepCount> get stepCountStream => _stepCountStream;

  Stream<PedestrianStatus> get pedestrianStatusStream =>
      _pedestrianStatusStream;

  /// Asks permission and initializes the pedometer service.
  Future<void> init() async {
    await _askPermission();

    /// Step count
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen((event) {
      onStepCount(event);
    }, onError: (object, stackTrace) {
      onError(object, stackTrace);
    }, onDone: () {
      print("Steps: Steps count stream is done");
    });

    /// Pedestrian status
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream.listen((event) {
      onPedestrianStatus(event);
    }, onError: (object, stackTrace) {
      onError(object, stackTrace);
    }, onDone: () {
      print("Steps: Pedestrian status stream is done");
    });
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

  /// Handles the pedestrian status events.
  void onPedestrianStatus(PedestrianStatus event) {
    print("Steps: Pedestrian status: $event");
  }
}
