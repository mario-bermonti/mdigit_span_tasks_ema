import 'package:flutter/material.dart';
import 'package:mdigits/src/app_bar/app_bar.dart';
import 'package:mdigits/src/task_list/view/widgets/task_tile.dart';
import 'package:mdigits/src/task_list/viewmodels/task_list_viewmodel.dart';

class TaskListPage extends StatelessWidget {
  final TaskListViewModel taskListViewModel = TaskListViewModel();

  TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: taskListViewModel.taskTileModels.length,
          itemBuilder: (context, index) {
            return TaskTile(
              taskTileModel: taskListViewModel.taskTileModels[index],
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
