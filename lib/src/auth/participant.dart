import 'package:get/get.dart';

/// Represents a single study participant and performs authentication
/// Can be used to keep track of participants' important info, including
/// "identifying" info.
class Participant extends GetxController {
  final String id;

  Participant({
    required this.id,
  });
}
