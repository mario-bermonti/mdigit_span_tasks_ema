import 'package:flutter/material.dart';
import 'package:mdigit_span_tasks/src/export_data/view/export_button.dart';

final AppBar appBar = AppBar(
  title: const Text('mDigitSpanTask'),
  centerTitle: true,
  actions: [
    ExportButton(),
  ],
);
