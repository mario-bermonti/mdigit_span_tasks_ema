import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/models/ema_model.dart';

/// Data source that provides basic interface for interacting with Firebase db.
class FirebaseDataSource {
  final FirebaseFirestore db;

  /// [db] is the instance of the Firestore database.
  FirebaseDataSource({required this.db});

  /// Add [EMAModel] to the db in [path].
  ///
  /// [path] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  Future<void> saveEMAModel({
    required EMAModel emaModel,
    required String path,
  }) async {
    final CollectionReference collectionRef = db.collection(path);
    await collectionRef.doc().set(emaModel.toJson());
  }
  }
}
