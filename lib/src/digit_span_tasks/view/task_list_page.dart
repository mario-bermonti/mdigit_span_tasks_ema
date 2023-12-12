import 'package:flutter/material.dart';

import 'task_buttons.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            DSFButton(),
            SizedBox(height: 10),
            DSBButton(),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
