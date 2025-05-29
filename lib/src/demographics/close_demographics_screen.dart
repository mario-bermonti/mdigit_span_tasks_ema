import 'package:get/get.dart';
import 'package:mdigits/src/core/navigator_service/navigator_service.dart';

Future<void> closeDemographicsScreen() async {
  final NavigatorService navigatorService = Get.find();
  final String nextScreen = await navigatorService.determineNextScreen();
  Get.offAndToNamed(nextScreen);
}
