import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/services/auth.dart';

void main() {
  test(
    "Auth.signIn() does not throw exceptions",
    () async {
      final Auth auth = Auth(auth: MockFirebaseAuth());
      await auth.signIn();
      expect(auth.signIn, returnsNormally);
    },
  );
}
