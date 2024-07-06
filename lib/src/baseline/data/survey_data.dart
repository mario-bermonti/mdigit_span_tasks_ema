import 'survey_item_data.dart';

class SurveyData {
  final String identifier;
  final String description;
  final String startTime;
  final String endTime;
  final List<SurveyItemData> items;

  SurveyData({
    required this.identifier,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.items,
  });
}
