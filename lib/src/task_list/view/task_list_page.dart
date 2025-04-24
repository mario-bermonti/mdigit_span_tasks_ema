import 'package:flutter/material.dart';
import 'package:mdigits/src/app_bar/app_bar.dart';
import 'task_buttons.dart';

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
            ListTile(
              title: Text("Memoria de números"),
              subtitle: Text("Recuerda los números en orden."),
            ),
            ListTile(
              title: Text("Memoria de números inversos"),
              subtitle: Text("Recuerda los números de atrás hacia adelante."),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
