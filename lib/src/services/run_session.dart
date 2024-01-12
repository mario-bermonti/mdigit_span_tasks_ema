import 'package:cognitive_data/trial_type.dart';
import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:mdigit_span_tasks/src/data_manager/data_manager.dart';
import 'package:mdigit_span_tasks/src/data_manager/session_id_creator.dart';
import 'package:mdigit_span_tasks/src/services/data_processor.dart';

import '../participant_info/participant_info_dialog.dart';

/// Run a data collection session
/// Running a session includes configuring everything needed and running a
/// cognitive task specificed with [taskRunner].
void runSession({required Function taskRunner, required String dbName}) async {
  final String participantID = await showParticipantInfoDialog();
  DigitSpanTasksData data = await taskRunner();

  /// We use the startTime for the practice session to create a single
  /// session id for both practice and experimental data.
  final String sessionID = createSessionID(
    participantID: participantID,
    startTime: data.practiceData.sessionData.startTime.toString(),
  );

  // Practice trials
  /// TODO Specify type
  final dataPractice = data.practiceData;
  await processData(
    participantID: participantID,
    sessionID: sessionID,
    data: dataPractice,
    dbName: dbName,
    trialType: TrialType.practice,
  );

  // Practice trials
  // TODO specify type
  final dataExperimental = data.experimentalData;
  await processData(
    participantID: participantID,
    sessionID: sessionID,
    data: dataExperimental,
    dbName: dbName,
    trialType: TrialType.experimental,
  );
}
