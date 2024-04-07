import 'package:firebase_auth/firebase_auth.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';

/// Manages authorization processes for the app
class Auth {
  /// [FirebaseAuth] instance used to access auth functionality.
  final FirebaseAuth auth;

  Auth({required this.auth});

  ///  Anonymously add or sign in the user into firebase.
  Future<Participant> signIn() async {
    final UserCredential userCredential = await auth.signInAnonymously();
    final Participant user = Participant.fromUserCredential(userCredential);
    if (user.uid == null || user.registerDateTime == null) {
      throw Exception('Error signing user into server');
    }
    return user;
  }
}
