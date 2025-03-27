import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view/widgets/notifications_permission_message.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view/widgets/permission_buttons_bar.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view_model/notification_permission_view_model.dart';

class NotificationsPermissionScreen extends StatelessWidget {
  final NotificationPermissionViewModel _viewModel =
      NotificationPermissionViewModel();

  NotificationsPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔔 Activa las notificaciones'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          children: [
            const NotificationsPermissionMessage(),
            const SizedBox(height: 50),
            PermissionButtonsBar(
              onDecline: _viewModel.onDeclined,
              onAccepted: _viewModel.onAccepted,
            ),
          ],
        ),
      ),
    );
  }
}
