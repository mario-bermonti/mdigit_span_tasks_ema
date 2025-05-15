import 'package:flutter/material.dart';
import 'package:mdigits/src/app_bar/app_bar.dart';
import 'package:mdigits/src/task_list/view/widgets/task_tile.dart';
import 'package:mdigits/src/task_list/viewmodels/task_list_viewmodel.dart';
import '../task_buttons.dart';

class TaskListPage extends StatelessWidget {
  final TaskListViewModel taskListViewModel = TaskListViewModel();

  TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TaskTile(
              title: taskListViewModel.taskTileModels[0].title,
              subtitle: taskListViewModel.taskTileModels[0].subtitle,
            ),
            TaskTile(
              title: taskListViewModel.taskTileModels[1].title,
              subtitle: taskListViewModel.taskTileModels[1].subtitle,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
