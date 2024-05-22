import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui_components/instructions.dart';

/// Presents and end message to participants.
class EndView extends StatelessWidget {
  const EndView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Instructions(
          text: '¡Terminamos la actividad!',
        ),
      ),
    );
  }
}
