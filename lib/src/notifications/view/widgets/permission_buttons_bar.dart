import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view/widgets/permission_button.dart';

class PermissionButtonsBar extends StatelessWidget {
  final void Function() _onDecline;

  const PermissionButtonsBar({super.key, required void Function() onDecline})
      : _onDecline = onDecline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        PermissionButton(
          onPressed: _onDecline,
          text: "No activar",
        ),
        PermissionButton(onPressed: () {}, text: "Activar"),
      ],
    );
  }
}
