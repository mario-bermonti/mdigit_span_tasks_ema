import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/ema/ema_screen.dart';
import 'package:mdigit_span_tasks_ema/src/task_list/view/task_list_page.dart';

import '../demographics/end_demographics_survey.dart';
import '../informed_consent/consent_screen.dart';
import '../surveys/demographics_survey.dart';
import 'landing_controller.dart';

class LandingScreen extends StatelessWidget {
  final LandingController _controller = Get.find();
  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.determineNextScreen();
    if (_controller.nextScreen.value == 'consent') {
      return ConsentScreen();
    } else if (_controller.nextScreen.value == 'demographicsSurvey') {
      return DemographicsSurvey(
        onSubmit: endDemographicsSurvey,
      );
    } else if (_controller.nextScreen.value == 'emaScreen') {
      return const EMAScreen();
    } else {
      return const TaskListPage();
    }
  }
}
