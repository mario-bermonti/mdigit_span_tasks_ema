import 'package:cloud_firestore/cloud_firestore.dart';

class EMAData {
  final FirebaseFirestore db;
  final String participantID;

  EMAData(
    this.db, {
    required this.participantID,
  });
}
