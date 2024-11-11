import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/demographics/end_demographics_survey.dart';
import 'package:mdigit_span_tasks_ema/src/ema/ema_screen.dart';
import 'package:mdigit_span_tasks_ema/src/informed_consent/consent_screen.dart';
import 'package:mdigit_span_tasks_ema/src/landing/landing_binding.dart';
import 'package:mdigit_span_tasks_ema/src/landing/landing_screen.dart';
import 'package:mdigit_span_tasks_ema/src/task_list/view/task_list_page.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';

import 'surveys/demographics_survey.dart';

final List<GetPage> routes = <GetPage>[
  GetPage(
    name: '/',
    page: () => LandingScreen(),
    binding: LandingBinding(),
  ),
  GetPage(name: '/tasklist', page: () => const TaskListPage()),
  GetPage(name: '/consent', page: () => ConsentScreen()),
  GetPage(
      name: '/demographicsSurvey',
      page: () => DemographicsSurvey(
            onSubmit: endDemographicsSurvey,
          )),
  GetPage(name: '/emaScreen', page: () => const EMAScreen()),
  GetPage(name: '/loading', page: () => const LoadingScreen()),
];
