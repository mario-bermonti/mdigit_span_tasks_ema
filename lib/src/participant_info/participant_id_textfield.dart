import 'package:flutter/material.dart';

class ParticipantIDTextInput extends StatelessWidget {
  const ParticipantIDTextInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'ID participante',
      ),
    );
  }
}
