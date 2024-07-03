import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialRouteManager extends GetxController {
  bool baselineCompleted = false;

  @override
  void onInit() {
    super.onInit();
    checkIfBaselineCompleted();

    /// Calls the redirect method after the current frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      redirectToInitialRoute();
    });
  }

  void checkIfBaselineCompleted() {
    final bool flag = GetStorage().read('baselineCompleted') ?? false;
    baselineCompleted = flag;
  }

  void redirectToInitialRoute() {
    if (baselineCompleted) {
      Get.toNamed('/tasklist');
    } else {
      Get.toNamed('/baselineSurvey');
    }
  }
}
