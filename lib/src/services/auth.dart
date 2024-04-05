import 'package:firebase_auth/firebase_auth.dart';

/// Manages authorization processes of the app
class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  /// Add or sign in the user anonymously into firebase.
  Future<void> signIn() async {
    final UserCredential userCredential = await auth.signInAnonymously();
  }
}
