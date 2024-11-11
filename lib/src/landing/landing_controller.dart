import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LandingController extends GetxController {
  RxString nextScreen = ''.obs;
  GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    determineNextScreen();
  }

  void determineNextScreen() {
    final bool consentCompleted = storage.read('consentCompleted') ?? false;
    final bool demographicsSurveyCompleted =
        storage.read('demographicsSurveyCompleted') ?? false;

    if (!consentCompleted) {
      nextScreen.value = 'consent';
    } else if (!demographicsSurveyCompleted) {
      nextScreen.value = 'demographicsSurvey';
    } else {
      nextScreen.value = 'tasklist';
    }
  }
}
