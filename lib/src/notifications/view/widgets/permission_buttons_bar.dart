import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/view/widgets/permission_button.dart';

class PermissionButtonsBar extends StatelessWidget {
  const PermissionButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        PermissionButton(onPressed: () {}, text: "No activar"),
        PermissionButton(onPressed: () {}, text: "Activar"),
      ],
    );
  }
}
