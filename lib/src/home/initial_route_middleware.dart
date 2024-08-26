import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final bool baselineCompleted =
        GetStorage().read('baselineCompleted') ?? false;

    if (baselineCompleted) {
      return const RouteSettings(name: '/tasklist');
    } else {
      return const RouteSettings(name: '/baselineSurvey');
    }
  }
}
