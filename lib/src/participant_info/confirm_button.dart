import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.green,
      ),
      onPressed: () => Get.back(),
    );
  }
}
