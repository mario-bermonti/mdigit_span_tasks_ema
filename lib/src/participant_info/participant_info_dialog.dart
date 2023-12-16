import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'confirm_button.dart';
import 'participant_id_textfield.dart';

Future<String> showParticipantInfoDialog() async {
  final TextEditingController controller = TextEditingController();

  await Get.defaultDialog(
    title: 'Información sobre sesión:',
    content: ParticipantIDTextInput(controller: controller),
    barrierDismissible: false,
    confirm: const ConfirmButton(),
  );
  return controller.text;
}
