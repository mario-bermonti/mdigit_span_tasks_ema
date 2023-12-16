import 'package:flutter/material.dart';

class ParticipantIDTextInput extends StatelessWidget {
  const ParticipantIDTextInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'ID participante',
        hintText: 'p123...',
      ),
      controller: controller,
      autofocus: true,
    );
  }
}
