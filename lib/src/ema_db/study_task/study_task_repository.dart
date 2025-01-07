import 'package:mdigit_span_tasks_ema/src/ema_db/datasources/firebase_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/study_task.dart';

/// Provides a simple interface for managing [StudyTask] data.
class StudyTaskRepository {
  final FirebaseDataSource _remoteDataSource;

  StudyTaskRepository({required FirebaseDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  /// Adds [studyTask] data to the db in the specified [path].
  ///
  /// Stores the [studyTask.metadata] in [path]/metadata and [studyTask.items]
  /// in [path]/items.
  /// [path] must be a valid path that can be used to create a firebase
  /// document.
  Future<void> saveStudyTask({
    required StudyTask studyTask,
    required String path,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: studyTask.metadata,
      path: '$path/metadata',
    );
    await _remoteDataSource.saveEMAModels(
      emaModels: studyTask.items,
      path: '$path/items',
    );
  }
}
