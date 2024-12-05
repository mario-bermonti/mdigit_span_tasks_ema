/// Represents a single study participant
class ParticipantModel {
  /// Unique identifier for this participant
  final String uid;

  /// Tokens for sending push notifications to this participant
  final List<String> fcmTokens = <String>[];

  ParticipantModel({
    required this.uid,
  });
}
