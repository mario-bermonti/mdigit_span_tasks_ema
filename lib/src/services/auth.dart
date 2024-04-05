import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    final UserCredential userCredential = await _auth.signInAnonymously();
  }
}
