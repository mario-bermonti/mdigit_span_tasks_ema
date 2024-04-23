import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/ema/ema_screen.dart';
import 'package:mdigit_span_tasks_ema/src/task_list/view/task_list_page.dart';

final List<GetPage> routes = <GetPage>[
  GetPage(name: '/', page: () => const TaskListPage()),
  GetPage(name: '/emaScreen', page: () => const EMAScreen()),
];
