import 'package:flutter/material.dart';

/// [ExportButton] Is used by the user to export the data from the app
class ExportButton extends StatelessWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.send_to_mobile),
      onPressed: () {},
    );
  }
}
