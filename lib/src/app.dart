import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/routes.dart';

import 'intl/internationalization.dart';

class MyApp extends StatelessWidget {
  final String _initialRoute;

  const MyApp({super.key, required String initialRoute})
      : _initialRoute = initialRoute;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DigitSpanTasks',
      initialRoute: _initialRoute,
      theme: ThemeData(primarySwatch: Colors.grey),
      getPages: routes,
      locale: locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      localeResolutionCallback: resolveLocale,
    );
  }
}
