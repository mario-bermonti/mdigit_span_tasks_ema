import 'package:get/get.dart';

import 'participant_id_textfield.dart';

Future<void> showParticipantInfoDialog() async {
  await Get.defaultDialog(
    title: 'Información sobre sesión:',
    content: const ParticipantIDTextInput(),
  );
}
