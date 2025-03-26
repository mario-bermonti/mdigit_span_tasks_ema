import 'package:get/get.dart';

class NotificationPermissionViewModel {
  void onDeclined() {
    Get.toNamed("landing_page");
  }
}
