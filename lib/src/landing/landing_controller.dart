import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_manager.dart';

class LandingController extends GetxController {
  RxString nextScreen = ''.obs;
  GetStorage storage = GetStorage();
  final NotificationsManager _notificationsManager = Get.find();

  void determineNextScreen() {
    final bool consentCompleted = storage.read('consentCompleted') ?? false;
    final bool demographicsSurveyCompleted =
        storage.read('demographicsSurveyCompleted') ?? false;

    if (!consentCompleted) {
      nextScreen.value = 'consent';
    } else if (_notificationsManager.notificationWhileOnTerminated != null) {
      nextScreen.value = 'emaScreen';
    } else if (!demographicsSurveyCompleted) {
      nextScreen.value = 'demographicsSurvey';
    } else {
      nextScreen.value = 'tasklist';
    }
  }
}
