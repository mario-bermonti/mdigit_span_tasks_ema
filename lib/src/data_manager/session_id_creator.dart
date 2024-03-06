/// Create a unique [String] identifier by concatenating the [participantID]
/// with the current time.
String createSessionID({required String participantID}) {
  final DateTime startTime = DateTime.now();
  final String sessionID = "${participantID}_${startTime.toString()}";

  return sessionID;
}
