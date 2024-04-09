import 'package:flutter/material.dart';

class NotificationsButton extends StatelessWidget {
  const NotificationsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.send),
      tooltip: 'Receive notification',
    );
  }
}
