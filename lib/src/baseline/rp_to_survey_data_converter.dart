import 'dart:convert';

import 'package:research_package/research_package.dart';

/// Converts an [RPTaskResult] from the [research_package] object into a
/// [SurveyData] object by extracting the relevant data and formatting it
/// appropriately.
class RPToSurveyDataConverter {
  /// Converts an [RPStepResult] from the [research_package] to a json object.
  /// This makes available all the data inside the [RPStepResult] and makes
  /// it easier to handle.
  Map<String, dynamic> rpStepResultToJson(RPStepResult item) {
    final String stringItem = jsonEncode(item.toJson());
    final Map<String, dynamic> jsonItem = jsonDecode(stringItem);
    return jsonItem;
  }
}
