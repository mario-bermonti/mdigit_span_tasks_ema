import 'dart:io';

import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

/// Provides data on step count and pedestrian status.
class StepCounterDataSource {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  /// Will be called every time a new step count is available.
  final void Function(StepCount)? onStepCount;

  /// Will be called every time a pedestrian status is available.
  final void Function(PedestrianStatus)? onPedestrianStatus;

  /// Will be called when an error occurs collecting data.
  ///
  /// Used for both step count and pedestrian status streams.
  final void Function(dynamic object, dynamic stackTrace)? onError;

  /// Will be called when the streams are done.
  ///
  /// Used for both step count and pedestrian status streams.
  final void Function()? onDone;

  StepCounterDataSource({
    this.onStepCount,
    this.onPedestrianStatus,
    this.onError,
    this.onDone,
  });

  /// Streams the step count data in real time.
  Stream<StepCount> get stepCountStream => _stepCountStream;

  Stream<PedestrianStatus> get pedestrianStatusStream =>
      _pedestrianStatusStream;

  /// Asks permission and initializes the step counter.
  Future<void> init() async {
    await _askPermission();
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen((event) {
      onStepCount?.call(event);
    }, onError: (object, stackTrace) {
      onError?.call(object, stackTrace);
    }, onDone: () {
      onDone?.call();
    });

    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream.listen((event) {
      onPedestrianStatus?.call(event);
    }, onError: (object, stackTrace) {
      onError?.call(object, stackTrace);
    }, onDone: () {
      onDone?.call();
    });
  }

  /// Asks the user for permission to access activity recognition on Android,
  /// if it has not been granted. It has no effect on iOS.
  Future<void> _askPermission() async {
    if (!Platform.isAndroid) return;
    final bool granted =
        await Permission.activityRecognition.request().isGranted;
    if (!granted) {
      throw Exception(
          "Activity recognition permission not granted: ${await Permission.activityRecognition.status}");
    }
  }
}
