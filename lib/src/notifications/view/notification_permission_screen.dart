import 'package:flutter/material.dart';

class NotificationsPermissionScreen extends StatelessWidget {
  const NotificationsPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔔 Activa las notificaciones'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleLarge,
            children: const [
              TextSpan(
                  text:
                      '🔔 Las notificaciones son muy importantes para este estudio.\n\n'),
              TextSpan(
                  text:
                      '📋 Si no las activas no podrás participar en algunas actividades.\n\n'),
              TextSpan(text: '🙏 Actívalas para no perderte nada.'),
            ],
          ),
        ),
      ),
    );
  }
}
