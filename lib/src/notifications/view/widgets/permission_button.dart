import 'package:flutter/material.dart';

class PermissionButton extends StatelessWidget {
  final void Function() _onPressed;

  final String _text;

  const PermissionButton({
    super.key,
    required void Function() onPressed,
    required String text,
  })  : _onPressed = onPressed,
        _text = text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: Text(_text),
    );
  }
}
