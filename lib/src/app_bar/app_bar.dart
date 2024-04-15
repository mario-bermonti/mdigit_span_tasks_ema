import 'package:flutter/material.dart';

import '../notifications/notifications_button.dart';

final AppBar appBar = AppBar(
  title: const Text('mDigitSpanTask'),
  centerTitle: true,
  actions: [NotificationsButton()],
);
