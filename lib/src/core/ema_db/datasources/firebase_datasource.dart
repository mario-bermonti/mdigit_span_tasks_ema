import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigits/src/core/ema_db/models/ema_model.dart';

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

  /// Add [EMAModel] to the db in the doc specific by [path].
  ///
  /// [path] must be a valid path that can be used to create a doc
  /// reference in the Firestore database.
  @override
  Future<void> saveNamedEMAModel({
    required EMAModel emaModel,
    required String path,
  }) async {
    final DocumentReference docRef = db.doc(path);
    await docRef.set(emaModel.toJson());
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

  /// Updates [EMAModel] on the db in the doc specific by [path].
  ///
  /// Only overrides fields present [emaModel]. Arrays (lists) are always
  /// updated by adding new elements and keeping old values.
  ///
  /// [path] must be a valid path that can be used to create a doc
  /// reference in the Firestore database.
  @override
  Future<void> updateEMAModel({
    required EMAModel emaModel,
    required String path,
  }) async {
    final Map<String, dynamic> emaModelNewData = emaModel.toJson()
      ..removeWhere((key, value) => value == null);

    /// Allow updating arrays, if any.
    emaModelNewData.forEach((key, value) {
      if (value is List) {
        emaModelNewData[key] = FieldValue.arrayUnion(value);
      } else {
        emaModelNewData[key] = value;
      }
    });

    final DocumentReference docRef = db.doc(path);
    await docRef.set(
      emaModelNewData,
      SetOptions(merge: true),
    );
  }

  /// Fetches the data from a single firebase doc defined by [path].
  ///
  /// [path] must be a valid path that can be used to create a doc.
  @override
  Future<Map<String, dynamic>?> getDataModel({required String path}) async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.doc(path).get();
    final Map<String, dynamic>? data = snapshot.data();
    return data;
  }

  /// Fetches all data from a firebase collection defined by [path].
  ///
  /// [path] must be a valid path that can be used to create a collection.
  @override
  Future<List<Map<String, dynamic>>?> getDataModels(
      {required String path}) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection(path).get();
    if (snapshot.docs.isEmpty) {
      return null;
    }
    final List<Map<String, dynamic>> dataModels =
        snapshot.docs.map((doc) => doc.data()).toList();

    return dataModels;
  }
}
