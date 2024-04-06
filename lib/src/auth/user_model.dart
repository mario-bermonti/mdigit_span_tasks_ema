import 'package:firebase_auth/firebase_auth.dart';

class Participant {
  final String? uid;
  final DateTime? registerDateTime;

  Participant({
    required this.uid,
    required this.registerDateTime,
  });

  Participant.fromUserCredential(UserCredential userCredential)
      : uid = userCredential.user?.uid,
        registerDateTime = userCredential.user?.metadata.creationTime;
}
