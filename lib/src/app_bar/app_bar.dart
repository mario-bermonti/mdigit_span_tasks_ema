import 'package:flutter/material.dart';

import '../notifications/notifications_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool allowBack;

  const CustomAppBar({super.key, this.allowBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('mDigitSpanTask'),
      centerTitle: true,
      automaticallyImplyLeading: allowBack,
      actions: [NotificationsButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
