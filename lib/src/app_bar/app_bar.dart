import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Whether a button to allow the user to go back to the previous screen
  /// will be presented.
  final bool allowBack;

  const CustomAppBar({super.key, this.allowBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('mDigits'),
      centerTitle: true,
      automaticallyImplyLeading: allowBack,
      // actions: [NotificationsButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
