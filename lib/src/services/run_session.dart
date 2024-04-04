import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/data_manager/session_id_creator.dart';
import 'package:mdigit_span_tasks_ema/src/services/data_processor.dart';

import '../participant_info/participant_info_dialog.dart';

/// Run a data collection session
/// Running a session includes configuring everything needed and running a
/// cognitive task specified with [taskRunner].
void runSession(
    {required Function({
      required String participantID,
      required String sessionID,
    }) taskRunner,
    required String taskName}) async {
  final String participantID = await showParticipantInfoDialog();

  /// We use the startTime for the practice session to create a single
  /// session id for both practice and experimental data.
  final String sessionID = createSessionID(
    participantID: participantID,
  );

  DigitSpanTaskData data = await taskRunner(
    participantID: participantID,
    sessionID: sessionID,
  );

  await processData(
    taskName: taskName,
    data: data,
  );
}
