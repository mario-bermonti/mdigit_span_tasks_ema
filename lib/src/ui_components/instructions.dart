import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Instructions extends StatelessWidget {
  final String text;

  const Instructions({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.back(),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
