import 'package:flutter/material.dart';

class EMAButton extends StatelessWidget {
  const EMAButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'EMA screen',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
