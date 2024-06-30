import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialRouteManager extends GetxController {
  bool baselineCompleted = false;

  @override
  void onInit() {
    super.onInit();
    checkIfBaselineCompleted();
    redirectToInitialRoute();
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
