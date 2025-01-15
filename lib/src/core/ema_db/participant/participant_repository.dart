import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/remote_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart';

class ParticipantRepository {
  final RemoteDataSource _remoteDataSource;

  ParticipantRepository({
    required RemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  Future<void> save({
    required Participant participant,
    required String pathRemoteDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: participant,
      path: pathRemoteDB,
    );
  }
}
