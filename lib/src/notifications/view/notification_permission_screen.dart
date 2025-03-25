import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view/widgets/notifications_permission_message.dart';

class NotificationsPermissionScreen extends StatelessWidget {
  const NotificationsPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔔 Activa las notificaciones'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          children: [
            NotificationsPermissionMessage(),
          ],
        ),
      ),
    );
  }
}
