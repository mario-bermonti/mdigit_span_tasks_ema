import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'digit_span_tasks/digit_span_tasks_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DigitSpanTasks',
      home: const MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
