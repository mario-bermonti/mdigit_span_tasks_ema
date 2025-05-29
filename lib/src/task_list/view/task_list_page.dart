import 'package:flutter/material.dart';
import 'package:mdigits/src/app_bar/app_bar.dart';
import 'task_buttons.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
