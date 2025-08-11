import 'package:flutter/material.dart';
import 'package:mdigits/src/task_list/models/task_tile_model.dart';

class TaskTile extends StatelessWidget {
  final TaskTileModel taskTileModel;

  const TaskTile({
    super.key,
    required this.taskTileModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async {
            await taskTileModel.onTap();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              title: Text(
                taskTileModel.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(taskTileModel.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
        ),
      ),
    );
  }
}
