import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view/widgets/notifications_permission_message.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view/widgets/permission_buttons_bar.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view_model/notification_permission_view_model.dart';

class NotificationsPermissionScreen extends StatelessWidget {
  late final NotificationPermissionViewModel _viewModel;

  NotificationsPermissionScreen({super.key}) {
    final Participant participant = Get.find();
    _viewModel =
        Get.put(NotificationPermissionViewModel(participantId: participant.id));
  }

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
