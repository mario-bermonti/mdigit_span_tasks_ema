import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  final String text;

  const Instructions({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}
