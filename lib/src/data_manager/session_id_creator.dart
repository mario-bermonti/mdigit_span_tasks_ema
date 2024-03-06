String createSessionID({required String participantID}) {
  final DateTime startTime = DateTime.now();
  final String sessionID = "${participantID}_${startTime.toString()}";

  return sessionID;
}
