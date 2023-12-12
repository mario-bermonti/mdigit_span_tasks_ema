import 'package:flutter/material.dart';
import 'task_buttons.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

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
