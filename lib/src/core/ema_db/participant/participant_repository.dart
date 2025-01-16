import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/local_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart';

class ParticipantRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  ParticipantRepository({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  Future<void> save({
    required Participant participant,
    required String pathRemoteDB,
    required String pathLocalDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: participant,
      path: pathRemoteDB,
    );

    await _localDataSource.saveEMAModel(
      emaModel: participant,
      path: pathLocalDB,
    );
  }

  Future<Participant> load({
    required String pathRemoteDB,
  }) async {
    return const Participant(id: "11");
  }
}
