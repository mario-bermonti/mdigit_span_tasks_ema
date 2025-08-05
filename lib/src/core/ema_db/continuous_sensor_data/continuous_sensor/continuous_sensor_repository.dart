import 'dart:async';

import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/grouped_continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/datasources/remote_datasource.dart';

/// Provides a simple interface for managing [ContinuousSensor] data.
///
/// Continuous sensor data is typically produced by the device's sensors.
class ContinuousSensorRepository {
  final RemoteDataSource _remoteDataSource;
  final List<ContinuousSensorModel> _cachedData = <ContinuousSensorModel>[];

  ContinuousSensorRepository({
    required RemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  /// Saves [ContinuousSensorModel] to the remote database.
  ///
  /// [pathRemoteDB] must be a valid path that can be used to create a collection
  /// reference in the Firestore database.
  Future<void> save({
    required ContinuousSensorModel continuousSensorData,
    required String pathRemoteDB,
  }) async {
    await _remoteDataSource.saveEMAModel(
      emaModel: continuousSensorData,
      path: pathRemoteDB,
    );
  }

  /// Adds [ContinuousSensorModel] to the cache for storing it later in the db.
  void cacheData({
    required ContinuousSensorModel continuousSensorData,
  }) {
    _cachedData.add(continuousSensorData);
  }

  /// Saves cached data to the remote database.
  ///
  /// Data are grouped into a [GroupedContinuousSensorData] and the cache is
  /// reset after saving the data.
  /// It does nothing if there is no cached data.
  Future<void> saveCachedData({
    required String pathRemoteDB,
  }) async {
    if (_cachedData.isEmpty) {
      return;
    }

    final List<ContinuousSensorModel> data =
        _cachedData.map((model) => model.copyWith()).toList();

    _cachedData.clear();

    final ContinuousSensorModel firstData = data.first;
    final ContinuousSensorModel lastData = data.last;
    final GroupedContinuousSensorData groupedData = GroupedContinuousSensorData(
      participantId: firstData.participantId,
      periodStart: firstData.timestamp,
      periodEnd: lastData.timestamp,
      sensorData: data,
    );

    await _remoteDataSource.saveEMAModel(
      emaModel: groupedData,
      path: pathRemoteDB,
    );
  }

  /// Schedules saving cached data to remote db periodically at [interval].
  void scheduleSavingCachedData({
    required Duration interval,
    required String pathRemoteDB,
  }) {
    Timer.periodic(interval, (_) {
      saveCachedData(pathRemoteDB: pathRemoteDB);
    });
  }
}
