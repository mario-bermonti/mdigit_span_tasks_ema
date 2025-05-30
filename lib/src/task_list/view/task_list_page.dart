import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/app_bar/app_bar.dart';
import 'package:mdigits/src/core/sensing/pedometer.dart/pedometer_service.dart';
import 'task_buttons.dart';

class TaskListPage extends StatelessWidget {
  TaskListPage({super.key});
  final PedometerService pedometer = Get.find();

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
            StreamBuilder(
              stream: pedometer.stepCountStream,
              initialData: 'initial Data',
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Steps: ${snapshot.data}',
                    style: const TextStyle(fontSize: 20),
                  );
                } else {
                  return const Text(
                    'Some issue occurred!',
                    style: TextStyle(fontSize: 20),
                  );
                }
              },
            ),
            StreamBuilder(
              stream: pedometer.pedestrianStatusStream,
              initialData: 'initial Data',
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Pedestrian Status: ${snapshot.data}',
                    style: const TextStyle(fontSize: 20),
                  );
                } else {
                  return const Text(
                    'Some issue occurred!',
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
