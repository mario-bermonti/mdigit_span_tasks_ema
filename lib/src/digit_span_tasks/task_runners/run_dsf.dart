import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:get/get.dart';
import '../config/config.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/instructions.dart';
import '../../ui_components/loading_screen.dart';
import '../prep_data.dart';
import 'rest_instructions.dart';

/// Configure and start the DSF
Future<DigitSpanTaskData> runDigitSpanForward() async {
  final DigitSpanTaskConfig config = Get.find();
  Get.to(() => const LoadingScreen());
  await Get.to(
    () => Instructions(
      instructions:
          InstructionsText('Recuerda los números en el orden en que los veas'),
    ),
  );
  await Get.to(
    () =>
        Instructions(instructions: InstructionsText('Comencemos practicando')),
  );
  DigitSpanTask task;
  final UserConfig userConfigPractice = UserConfig(
    stimList: config.stim.practiceStim,
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
            'Recuerda escribir los números en el orden en que los veas')),
  );

  final UserConfig userConfigExperimental = UserConfig(
    stimList: config.stim.experimentalStim,
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
