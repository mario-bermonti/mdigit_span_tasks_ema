import 'package:firebase_auth/firebase_auth.dart';

/// Manages authorization processes for the app
class Auth {
  /// [FirebaseAuth] instance used to access auth functionality.
  final FirebaseAuth auth;

  Auth({required this.auth});

  ///  Anonymously add or sign in the user into firebase.
  Future<void> signIn() async {
    final UserCredential userCredential = await auth.signInAnonymously();
  }
}
