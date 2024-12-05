/// Represents a single study participant and performs authentication
/// Can be used to keep track of participants' important info, including
/// "identifying" info.
class ParticipantModel {
  final String id;
  final List<String> fcmTokens;

  ParticipantModel({
    required this.id,
    required this.fcmTokens,
  });
}
