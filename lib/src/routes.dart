import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/ema/ema_screen.dart';
import 'package:mdigit_span_tasks_ema/src/task_list/view/task_list_page.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';

import 'baseline/baseline_survey_screen.dart';

final List<GetPage> routes = <GetPage>[
  GetPage(name: '/', page: () => BaselineSurveyScreen()),
  GetPage(name: '/tasklist', page: () => const TaskListPage()),
  GetPage(name: '/emaScreen', page: () => const EMAScreen()),
  GetPage(name: '/loading', page: () => const LoadingScreen()),
];
