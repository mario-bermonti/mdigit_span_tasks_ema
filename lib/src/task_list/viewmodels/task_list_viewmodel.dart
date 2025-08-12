import 'package:get/get.dart';
import 'package:mdigits/src/digit_span_tasks/config/config.dart';
import 'package:mdigits/src/digit_span_tasks/task_runners/run_dsb.dart';
import 'package:mdigits/src/digit_span_tasks/task_runners/run_dsf.dart';
import 'package:mdigits/src/services/run_session.dart';
import 'package:mdigits/src/task_list/models/task_tile_model.dart';

class TaskListViewModel {
  List<TaskTileModel> taskTileModels = <TaskTileModel>[
    TaskTileModel(
      title: "Memoria de números",
      subtitle: "Recuerda los números en orden.",
      onTap: () async {
        final DigitSpanTaskConfig config = Get.find();
        config.taskName = 'dsf';
        config.practiceMinStimSize = 2;
        config.practiceMaxStimSize = 2;
        config.practiceCountEachSize = 1;
        config.experimentalMinStimSize = 4;
        config.experimentalMaxStimSize = 4;
        config.experimentalCountEachSize = 1;
        config.nextScreen = '/';
        await runSession(taskRunner: runDigitSpanForward);
      },
    ),
    TaskTileModel(
      title: "Memoria de números inversos",
      subtitle: "Recuerda los números de atrás hacia adelante.",
      onTap: () async {
        final DigitSpanTaskConfig config = Get.find();
        config.taskName = 'dsb';
        config.nextScreen = '/';
        config.practiceMinStimSize = 2;
        config.practiceMaxStimSize = 2;
        config.practiceCountEachSize = 1;
        config.experimentalMinStimSize = 3;
        config.experimentalMaxStimSize = 3;
        config.experimentalCountEachSize = 1;
        await runSession(taskRunner: runDigitSpanBackwards);
      },
    )
  ];
}
