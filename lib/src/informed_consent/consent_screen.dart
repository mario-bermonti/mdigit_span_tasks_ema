import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/informed_consent/consent_controller.dart';

class ConsentScreen extends StatelessWidget {
  final ConsentController _controller = Get.find();

  ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Consent'),
    );
  }
}
