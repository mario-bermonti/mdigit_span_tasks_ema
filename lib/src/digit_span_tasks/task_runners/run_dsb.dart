import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config.dart';
import 'rest_instructions.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';
import '../../ui_components/instructions.dart';
import '../config/stim_dsb.dart';
import '../prep_data.dart';

/// Configure and start the DSB
Future<DigitSpanTaskData> runDigitSpanBackwards() async {
  final DigitSpanTaskConfig config = Get.find();
  Get.to(() => const LoadingScreen());
  await Get.to(
    () => Instructions(
        instructions: InstructionsText(
            'Recuerda los números al revés al orden en que los veas')),
  );
  await Get.to(
    () => Instructions(
        instructions: Column(
      children: [
        InstructionsText('Ejemplo:'),
        InstructionsText('Si ves 49'),
        InstructionsText('Escribe 94'),
      ],
    )),
  );
  await Get.to(
    () => Instructions(
        instructions: Column(
      children: [
        InstructionsText('Ejemplo:'),
        InstructionsText('Si ves 491'),
        InstructionsText('Escribe 194'),
      ],
    )),
  );
  await Get.to(
    () =>
        Instructions(instructions: InstructionsText('Comencemos practicando')),
  );
  DigitSpanTask task;
  final DSBStim dsbConfig = DSBStim();
  final UserConfig userConfigPractice = UserConfig(
    stimList: config.practiceStim,
    participantID: config.participantID,
    sessionID: config.sessionID,
    sessionType: SessionType.practice,
    restInstructions: const RestInstructions(),
  );

  task = DigitSpanTask(
    config: userConfigPractice,
  );
  DigitSpanTaskData practiceData = await task.run();

  await Get.to(
    () => Instructions(
        instructions: InstructionsText(
            'Ahora trabajaremos con los ejercicios principales')),
  );
  await Get.to(
    () => Instructions(
        instructions: InstructionsText(
            'Recuerda escribir los números al revés al orden en que los veas')),
  );

  final UserConfig userConfigExperimental = UserConfig(
    stimList: config.experimentalStim,
    participantID: config.participantID,
    sessionID: config.sessionID,
    sessionType: SessionType.experimental,
    restInstructions: const RestInstructions(),
  );

  task = DigitSpanTask(
    config: userConfigExperimental,
  );
  DigitSpanTaskData experimentalData = await task.run();

  final DigitSpanTaskData data = prepData(
    practiceData: practiceData,
    experimentalData: experimentalData,
  );

  await Get.to(() => Instructions(
      instructions: InstructionsText('¡Terminamos esta actividad!')));

  Get.toNamed('/');
  return data;
}
