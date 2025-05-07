import 'package:flutter/material.dart';
import 'package:mdigits/src/app_bar/app_bar.dart';
import 'package:mdigits/src/task_list/view/widgets/task_tile.dart';
import '../task_buttons.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const <Widget>[
            TaskTile(
              title: "Memoria de números",
              subtitle: "Recuerda los números en orden.",
            ),
            TaskTile(
              title: "Memoria de números inversos",
              subtitle: "Recuerda los números de atrás hacia adelante.",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
