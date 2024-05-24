import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';
import '../../ui_components/instructions.dart';
import '../config/config_dsb.dart';
import '../prep_data.dart';

/// Configure and start the DSB
Future<DigitSpanTaskData> runDigitSpanBackwards({
  required String participantID,
  required String sessionID,
}) async {
  Get.to(() => const LoadingScreen());
  await Get.to(
    () => const Instructions(
        instructions:
            Text('Recuerda los números al revés al orden en que los veas')),
  );
  await Get.to(
    () => const Instructions(
        instructions: Column(
      children: [
        Text('Ejemplo:'),
        Text('Si ves 49'),
        Text('Escribe 94'),
      ],
    )),
  );
  await Get.to(
    () => const Instructions(
        instructions: Column(
      children: [
        Text('Ejemplo:'),
        Text('Si ves 491'),
        Text('Escribe 194'),
      ],
    )),
  );
  await Get.to(
    () => const Instructions(instructions: Text('Comencemos practicando')),
  );
  DigitSpanTask task;
  final DSBConfig dsbConfig = DSBConfig();
  final UserConfig userConfigPractice = UserConfig(
    stimList: dsbConfig.practiceStim,
    participantID: participantID,
    sessionID: sessionID,
    sessionType: SessionType.practice,
  );

  task = DigitSpanTask(
    config: userConfigPractice,
  );
  DigitSpanTaskData practiceData = await task.run();

  await Get.to(
    () => const Instructions(
        instructions:
            Text('Ahora trabajaremos con los ejercicios principales')),
  );
  await Get.to(
    () => const Instructions(
        instructions: Text(
            'Recuerda escribir los números al revés al orden en que los veas')),
  );

  final UserConfig userConfigExperimental = UserConfig(
    stimList: dsbConfig.experimentalStim,
    participantID: participantID,
    sessionID: sessionID,
    sessionType: SessionType.experimental,
  );

  task = DigitSpanTask(
    config: userConfigExperimental,
  );
  DigitSpanTaskData experimentalData = await task.run();

  final DigitSpanTaskData data = prepData(
    practiceData: practiceData,
    experimentalData: experimentalData,
  );

  await Get.to(() =>
      const Instructions(instructions: Text('¡Terminamos esta actividad!')));

  Get.toNamed('/');
  return data;
}
