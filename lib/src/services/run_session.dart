import 'package:mdigit_span_tasks/src/data_manager/data_manager.dart';

import '../participant_info/participant_info_dialog.dart';

/// Run a data collection session
/// Running a session includes configuring everything needed and running a
/// cognitive task specificed with [taskRunner].
void runSession({required Function taskRunner}) async {
  final String participantID = await showParticipantInfoDialog();
  taskRunner();
  DataManager dataManager = DataManager(participantID: participantID);
}
