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

  /// TODO Specify type
  final dataPractice = data.practiceData;
  final String sessionID = createSessionID(
    participantID: participantID,
    startTime: data.practiceData.sessionData.startTime.toString(),
  );

  await processData(
    participantID: participantID,
    sessionID: sessionID,
    data: dataPractice,
    dbName: dbName,
    trialType: TrialType.practice,
  );
}
