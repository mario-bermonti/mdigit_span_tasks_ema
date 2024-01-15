String createSessionID(
    {required String participantID, required String startTime}) {
  final String sessionID = participantID + startTime;

  return sessionID;
}
