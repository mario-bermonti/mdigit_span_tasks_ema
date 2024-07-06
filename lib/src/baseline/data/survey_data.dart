import 'survey_item_data.dart';

class SurveyData {
  /// Short description of the item
  final String identifier;

  /// Longer description than the [identifier].
  /// It's usually the text presented to the participant or
  /// a long description.
  final String description;
  final String startTime;
  final String endTime;

  /// List of survey items that include the data about the item and
  /// the participant's responses.
  final List<SurveyItemData> items;

  SurveyData({
    required this.identifier,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.items,
  });
}
