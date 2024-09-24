import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final bool consentCompleted =
        GetStorage().read('consentCompleted') ?? false;
    final bool demographicsSurveyCompleted =
        GetStorage().read('demographicsSurveyCompleted') ?? false;

    if (!consentCompleted) {
      return const RouteSettings(name: 'consent');
    } else if (!demographicsSurveyCompleted) {
      return const RouteSettings(name: '/demographicsSurvey');
    }
    return const RouteSettings(name: '/tasklist');
  }
}
