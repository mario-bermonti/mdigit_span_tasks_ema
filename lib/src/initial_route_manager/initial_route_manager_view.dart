import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/initial_route_manager/initial_route_manager_controller.dart';
import 'package:mdigit_span_tasks_ema/src/ui_components/loading_screen.dart';

class InitialRouteManagerView extends StatelessWidget {
  InitialRouteManagerView({super.key});

  final InitialRouteManager _controller = Get.put(InitialRouteManager());

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}
