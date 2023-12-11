import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digit_span_tasks/digit_span_tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DigitSpanTasks',
      home: const MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void runDigitSpanForward() async {
    UserConfig config = UserConfig(
      stimListPractice: ['01', '234'],
      stimListExperimental: ['5678', '01567', '987654'],
    );
    DigitSpanTasksData data = await Get.to(() => DigitSpanForward(
          config: config,
        ));
    // ignore: avoid_print
    print('\n\n\nFORWARD data \n $data');
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
