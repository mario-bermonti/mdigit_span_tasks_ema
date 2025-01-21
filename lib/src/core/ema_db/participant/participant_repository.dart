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
    await _remoteDataSource.saveNamedEMAModel(
      emaModel: participant,
      path: pathRemoteDB,
    );

    await _localDataSource.saveEMAModel(
      emaModel: participant,
      path: pathLocalDB,
    );
  }

  /// Fetches the [participant] from the database.
  ///
  /// It will try the remote db first and update the local data with the remote
  /// data. It will fall back to the local db if the remote db is not available.
  Future<Participant?> get({
    required String pathRemoteDB,
    required String pathLocalDB,
  }) async {
    Map<String, dynamic>? participantJson =
        await _remoteDataSource.getDataModel(
      path: pathRemoteDB,
    );
    if (participantJson != null) {
      final Participant participant = Participant.fromJson(participantJson);
      _localDataSource.saveEMAModel(emaModel: participant, path: pathLocalDB);
      return participant;
    }

    participantJson = await _localDataSource.getDataModel(path: pathLocalDB);
    if (participantJson != null) {
      return Participant.fromJson(participantJson);
    }

    return null;
  }
}
