import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'participant_id_textfield.dart';

Future<void> showParticipantInfoDialog() async {
  final TextEditingController controller = TextEditingController();

  await Get.defaultDialog(
    title: 'Información sobre sesión:',
    content: ParticipantIDTextInput(controller: controller),
    barrierDismissible: false,
    confirm: IconButton(
      icon: const Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.green,
      ),
      onPressed: () => Get.back(),
    ),
  );
}
