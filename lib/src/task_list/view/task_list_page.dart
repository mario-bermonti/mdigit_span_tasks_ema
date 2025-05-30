import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/app_bar/app_bar.dart';
import 'package:mdigits/src/core/sensing/step_counter/step_counter_service.dart';
import 'package:pedometer/pedometer.dart';
import 'task_buttons.dart';

class TaskListPage extends StatelessWidget {
  TaskListPage({super.key});
  final StepCounterService pedometer = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const DSFButton(),
            const SizedBox(height: 10),
            const DSBButton(),
            StreamBuilder<StepCount>(
              stream: pedometer.stepCountStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Steps: Some issue occurred!: ${snapshot.error}',
                    style: const TextStyle(fontSize: 20),
                  );
                } else if (snapshot.hasData) {
                  return Text(
                    'Steps: ${snapshot.data}',
                    style: const TextStyle(fontSize: 20),
                  );
                } else {
                  return const Text(
                    'Steps: ?',
                    style: TextStyle(fontSize: 20),
                  );
                }
              },
            ),
            StreamBuilder(
              stream: pedometer.pedestrianStatusStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Pedestrian status: Some issue occurred!: ${snapshot.error}',
                    style: const TextStyle(fontSize: 20),
                  );
                } else if (snapshot.hasData) {
                  return Text(
                    'Pedestrian: ${snapshot.data}',
                    style: const TextStyle(fontSize: 20),
                  );
                } else {
                  return const Text(
                    'Pedestrian status: ?',
                    style: TextStyle(fontSize: 20),
                  );
                }
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
