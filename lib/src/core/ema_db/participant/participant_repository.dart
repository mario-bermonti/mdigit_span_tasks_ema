import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/local_datasource.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/datasources/remote_datasource.dart';

class ParticipantRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  ParticipantRepository({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;
}