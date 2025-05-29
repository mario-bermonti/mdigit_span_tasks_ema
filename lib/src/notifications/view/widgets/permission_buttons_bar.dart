import 'package:flutter/material.dart';
import 'package:mdigits/src/notifications/view/widgets/permission_button.dart';

class PermissionButtonsBar extends StatelessWidget {
  final void Function() _onDecline;
  final void Function() _onAccepted;

  const PermissionButtonsBar({
    super.key,
    required void Function() onDecline,
    required void Function() onAccepted,
  })  : _onDecline = onDecline,
        _onAccepted = onAccepted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PermissionButton(
          onPressed: _onDecline,
          text: "No activar",
        ),
        PermissionButton(
          onPressed: _onAccepted,
          text: "Activar",
        ),
      ],
    );
  }
}
