import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Present a [screen] [Widget] for [duration].
Future<void> showScreenForDuration({
  required Widget Function() screen,
  required Duration duration,
}) async {
  Get.to(screen());
  await Future.delayed(
    duration,
  );
}
