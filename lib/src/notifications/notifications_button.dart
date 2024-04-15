import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notifications.dart';

class NotificationsButton extends StatelessWidget {
  final Notifications _notifications = Get.find();

  NotificationsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await _notifications.showNotification(
            title: 'title', body: 'body', payload: 'payload');
      },
      icon: const Icon(Icons.send),
      tooltip: 'Receive notification',
    );
  }
}
