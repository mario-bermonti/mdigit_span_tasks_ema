/// Model that represents the data for a single survey item.
class SurveyItemData {
  final DateTime startTime;
  final DateTime endTime;

  /// Short description of the item
  final String identifier;

  /// Longer description than the [identifier].
  /// It's usually the text presented to the participant or
  /// a long description.
  final String description;

  /// Type of survey item present to understand the response scale.
  /// Common options are single choice, multiple choice, free text.
  final String type;
  final String response;

  /// Possible choices the participant select from.
  final List<String> choices;

  SurveyItemData({
    required this.startTime,
    required this.endTime,
    required this.identifier,
    required this.description,
    required this.type,
    required this.response,
    required this.choices,
  });
}
