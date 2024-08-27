import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/demographics/process_demographics_data.dart';
import 'package:mdigit_span_tasks_ema/src/ema/ema_screen.dart';
import 'package:mdigit_span_tasks_ema/src/task_list/view/task_list_page.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';

import 'baseline/baseline_survey_screen.dart';
import 'home/home.dart';
import 'home/initial_route_middleware.dart';

final List<GetPage> routes = <GetPage>[
  GetPage(
      name: '/',
      page: () => const HomeScreen(),
      middlewares: [InitialRouteMiddleware()]),
  GetPage(name: '/tasklist', page: () => const TaskListPage()),
  GetPage(
      name: '/baselineSurvey',
      page: () => BaselineSurveyScreen(
            onSubmit: endDemographicsSurvey,
          )),
  GetPage(name: '/emaScreen', page: () => const EMAScreen()),
  GetPage(name: '/loading', page: () => const LoadingScreen()),
];
