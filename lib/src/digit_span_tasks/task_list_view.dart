import 'package:digit_span_tasks/digit_span_tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'run_dsf.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: runDigitSpanForward,
              child: Text(
                'Digit Span Forward',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: runDigitSpanBackwards,
              child: Text(
                'Digit Span Backwards',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }

  void runDigitSpanBackwards() async {
    UserConfig config = UserConfig(
      stimListPractice: ['23', '567'],
      stimListExperimental: ['0123', '45678', '901234'],
    );
    DigitSpanTasksData data = await Get.to(() => DigitSpanBackwards(
          config: config,
        ));
    // ignore: avoid_print
    print('\n\n\nBAKWARDS data \n $data');
  }
}
