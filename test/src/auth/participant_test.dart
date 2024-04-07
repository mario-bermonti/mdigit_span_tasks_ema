import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';

void main() {
  test(
    "When passing a null uid, Participant's constructor will throw an exception",
    () {
      expect(
        () => Participant(uid: null, registerDateTime: DateTime.now()),
        throwsException,
      );
    },
  );
}
