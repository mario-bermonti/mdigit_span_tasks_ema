import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/ema/ema_screen.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view/notification_permission_screen.dart';
import 'package:mdigit_span_tasks_ema/src/task_list/view/task_list_page.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';

import '../demographics/end_demographics_survey.dart';
import '../informed_consent/consent_screen.dart';
import '../surveys/demographics_survey.dart';
import 'landing_controller.dart';

/// Redirects the user to the appropriate route based on the user's progress.
///
/// Used by many screens as a redirection tool.
class LandingScreen extends StatelessWidget {
  final LandingController _controller = Get.find();
  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.determineNextScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          if (_controller.nextScreen == 'consent') {
            return ConsentScreen();
          } else if (_controller.nextScreen == 'notificationsPermission') {
            return NotificationsPermissionScreen();
          } else if (_controller.nextScreen == 'demographicsSurvey') {
            return DemographicsSurvey(
              onSubmit: endDemographicsSurvey,
            );
          } else if (_controller.nextScreen == 'emaScreen') {
            return const EMAScreen();
          } else {
            return const TaskListPage();
          }
        });
  }
}
