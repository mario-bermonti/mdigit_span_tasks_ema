import '../participant_info/participant_info_dialog.dart';

/// Run a data collection session
/// Running a session includes configuring everything needed and running a
/// cognitive task specificed with [taskRunner].
void runSession({required Function taskRunner}) async {
  await showParticipantInfoDialog();
  taskRunner();
}
