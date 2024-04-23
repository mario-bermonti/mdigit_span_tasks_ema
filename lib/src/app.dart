import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/routes.dart';

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
    );
  }
}
