import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const TaskTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
