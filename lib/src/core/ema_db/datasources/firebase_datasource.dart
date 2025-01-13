import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

/// Data source that provides basic interface for interacting with Firebase db.
class FirebaseDataSource implements RemoteDataSource {
  final FirebaseFirestore db;

  /// [db] is the instance of the Firestore database.
  FirebaseDataSource({required this.db});

  /// Add [EMAModel] to the db in [path].
  ///
  /// [path] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  @override
  Future<void> saveEMAModel({
    required EMAModel emaModel,
    required String path,
  }) async {
    final CollectionReference collectionRef = db.collection(path);
    await collectionRef.doc().set(emaModel.toJson());
  }

  /// Add [EMAModel]s to the db in [path].
  ///
  /// [EMAModel]s are stored in separate docs in path. EMAModel are added using
  /// a [WriteBatch] so either all or none are added.
  @override
  Future<void> saveEMAModels({
    required List<EMAModel> emaModels,
    required String path,
  }) async {
    final CollectionReference collectionRef = db.collection(path);

    final WriteBatch batch = db.batch();

    for (EMAModel emaModel in emaModels) {
      Map<String, dynamic> jsonEmaModel = emaModel.toJson();
      batch.set(collectionRef.doc(), jsonEmaModel);
    }
    await batch.commit();
  }
}
