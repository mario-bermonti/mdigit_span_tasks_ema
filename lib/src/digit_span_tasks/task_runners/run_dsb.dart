import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config.dart';
import 'rest_instructions.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';
import '../../ui_components/instructions.dart';
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
  final UserConfig userConfigPractice = UserConfig(
    participantID: config.participantID,
    sessionID: config.sessionID,
    sessionType: SessionType.practice,
    restInstructions: const RestInstructions(),
    minStimSize: config.practiceMinStimSize,
    maxStimSize: config.practiceMaxStimSize,
    countEachSize: config.practiceCountEachSize,
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
    participantID: config.participantID,
    sessionID: config.sessionID,
    sessionType: SessionType.experimental,
    restInstructions: const RestInstructions(),
    minStimSize: config.experimentalMinStimSize,
    maxStimSize: config.experimentalMaxStimSize,
    countEachSize: config.experimentalCountEachSize,
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

  Get.toNamed(config.nextScreen);
  return data;
}
