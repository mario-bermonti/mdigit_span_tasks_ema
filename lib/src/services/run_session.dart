import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';
import 'package:mdigit_span_tasks_ema/src/data_manager/session_id_creator.dart';
import 'package:mdigit_span_tasks_ema/src/auth/auth.dart';
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/config/config.dart';
import 'package:mdigit_span_tasks_ema/src/services/data_processor.dart';

/// Run a data collection session
/// Running a session includes configuring everything needed and running a
/// cognitive task specified with [taskRunner].
Future<void> runSession({
  required Function taskRunner,
}) async {
  final DigitSpanTaskConfig config = Get.find();
  final Participant participant =
      await Auth(auth: FirebaseAuth.instance).signIn();
  config.participantID = participant.id;

  /// We use the startTime for the practice session to create a single
  /// session id for both practice and experimental data.
  config.sessionID = createSessionID(
    participantID: config.participantID,
  );

  DigitSpanTaskData data = await taskRunner();

  await processData(
    data: data,
  );
}
