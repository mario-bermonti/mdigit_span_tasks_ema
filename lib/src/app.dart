import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/routes.dart';
import 'package:research_package/research_package.dart';

import 'intl/internationalization.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DigitSpanTasks',
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.grey),
      getPages: routes,
      locale: locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      localeResolutionCallback: resolveLocale,
    );
  }
}
