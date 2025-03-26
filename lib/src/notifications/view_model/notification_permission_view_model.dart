import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';

class NotificationPermissionViewModel {
  void onDeclined() {
    Get.toNamed("landing_page");
  }

  Future<void> onAccepted() async {
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
  }
}
