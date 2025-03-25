import 'package:flutter/material.dart';

class NotificationsPermissionMessage extends StatelessWidget {
  const NotificationsPermissionMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}
