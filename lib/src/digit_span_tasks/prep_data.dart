import 'package:cognitive_data/cognitive_data.dart';
import 'package:digit_span_tasks/digit_span_tasks.dart';

DigitSpanTaskData prepData({
  required DigitSpanTaskData practiceData,
  required DigitSpanTaskData experimentalData,
}) {
  final Session session = Session(
      participantID: practiceData.session.participantID,
      sessionID: practiceData.session.sessionID,
      startTime: practiceData.session.startTime,
      endTime: experimentalData.session.endTime);

  final Device device = Device(
    participantID: practiceData.session.participantID,
    sessionID: practiceData.session.sessionID,
  );

  final List<Trial> trials = practiceData.trials + experimentalData.trials;

  final DigitSpanTaskData data =
      DigitSpanTaskData(trials: trials, session: session, device: device);

  return data;
}
