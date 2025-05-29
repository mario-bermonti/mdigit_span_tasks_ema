import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/auth/auth.dart';

void main() {
  test(
    "Auth.signIn() does not throw exceptions",
    () async {
      final Auth auth = Auth(auth: MockFirebaseAuth());
      expect(() async => await auth.signIn(), returnsNormally);
    },
  );
}
