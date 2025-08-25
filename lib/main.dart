import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/app.dart';
import 'package:mdigits/src/core/navigator_service/navigator_service.dart';
import 'package:mdigits/src/core/setup/app_setup_service.dart';

Future<void> main() async {
  final AppSetupService appSetupService = AppSetupService();
  await appSetupService.initOnLaunch();

  final NavigatorService navigatorService = Get.find();
  final String initialRoute = await navigatorService.determineNextScreen();
  runApp(MyApp(initialRoute: initialRoute));
}
