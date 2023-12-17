import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:mdigit_span_tasks/src/data_manager/data_manager.dart';

import '../participant_info/participant_info_dialog.dart';

/// Run a data collection session
/// Running a session includes configuring everything needed and running a
/// cognitive task specificed with [taskRunner].
void runSession({required Function taskRunner}) async {
  final String participantID = await showParticipantInfoDialog();
  DigitSpanTasksData data = await taskRunner();

  /// TODO Specify type
  final data_practice = data.practiceData;
  final data_experimental = data.experimentalData;
  DataManager dataManager = DataManager(
    participantID: participantID,
    data: data,
  );
  dataManager.createSessionID();
}
