import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/task_list/models/task_tile_model.dart';

class TaskTile extends StatelessWidget {
  final TaskTileModel taskTileModel;

  const TaskTile({
    super.key,
    required this.taskTileModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await taskTileModel.onTap();
      },
      child: ListTile(
        title: Text(taskTileModel.title),
        subtitle: Text(taskTileModel.subtitle),
      ),
    );
  }
}
