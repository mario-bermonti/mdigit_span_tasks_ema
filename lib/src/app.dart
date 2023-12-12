import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'digit_span_tasks/task_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DigitSpanTasks',
      home: const TaskListPage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
