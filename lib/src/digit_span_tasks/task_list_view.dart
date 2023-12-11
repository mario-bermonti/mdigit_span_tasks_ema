import 'package:flutter/material.dart';

import 'run_dsb.dart';
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
}
