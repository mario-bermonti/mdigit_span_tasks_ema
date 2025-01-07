import 'package:mdigit_span_tasks_ema/src/ema_db/models/ema_model.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/metadata/metadata.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/task_item.dart';

/// Base class for all study tasks.
abstract class StudyTask extends EMAModel {
  /// Metadata about the data collection session.
  Metadata get metadata;

  /// Data for each task item, including responses and item's
  /// metadata (e.g., time).
  List<TaskItem> get items;
}
