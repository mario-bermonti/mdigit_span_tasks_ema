import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialRouteManager extends GetxController {
  bool baselineCompleted = false;

  @override
  void onInit() {
    super.onInit();
    checkIfBaselineCompleted();
  }

  void checkIfBaselineCompleted() {
    final bool flag = GetStorage().read('baselineCompleted') ?? false;
    baselineCompleted = flag;
  }
}
