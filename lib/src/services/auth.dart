import 'package:firebase_auth/firebase_auth.dart';

/// Manages authorization processes of the app
class Auth {
  /// [FirebaseAuth] instance used to access auth functionality
  final FirebaseAuth auth;

  Auth({required this.auth});

  /// Add or sign in the user anonymously into firebase.
  Future<void> signIn() async {
    final UserCredential userCredential = await auth.signInAnonymously();
  }
}
