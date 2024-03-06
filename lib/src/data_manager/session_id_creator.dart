String createSessionID({required String participantID}) {
  final DateTime startTime = DateTime.now();
  final String sessionID = participantID + startTime.toString();

  return sessionID;
}
