import 'package:mdigit_span_tasks_ema/src/task_list/models/task_tile_model.dart';

class TaskListViewModel {
  List<TaskTileModel> taskTileModels = <TaskTileModel>[
    TaskTileModel(
      title: "Memoria de números",
      subtitle: "Recuerda los números en orden.",
    ),
    TaskTileModel(
      title: "Memoria de números inversos",
      subtitle: "Recuerda los números de atrás hacia adelante.",
    )
  ];
}
