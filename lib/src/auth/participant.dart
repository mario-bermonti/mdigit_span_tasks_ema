class Participant {
  late final String uid;
  late final DateTime registerDateTime;

  Participant({
    required String? uid,
    required DateTime? registerDateTime,
  }) {
    if (uid == null || registerDateTime == null) {
      throw Exception('Error creating participant model');
    } else {
      this.uid = uid;
      this.registerDateTime = registerDateTime;
    }
  }
}
