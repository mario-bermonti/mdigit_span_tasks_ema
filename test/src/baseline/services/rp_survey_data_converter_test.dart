import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/services/rp_survey_data_converter.dart';
import 'package:research_package/model.dart';

void main() {
  group('rpSurveyDataToJson', () {
    test(
      """
    Given an RPResults, surveyDataToJson() returns a Map<String, dynamic> that 
    contains the following keys that map to the specified values: 
    `identifier` maps to a String value, `start_date` maps to a String,
    `end_date` maps to a String, `results` maps to Map.
    """,
      () {
        final Map<String, dynamic> expectedData = {
          "identifier": "survey",
          "start_date": "2024-07-04T16:04:08.889902",
          "end_date": "2024-07-04T16:22:03.940516",
          "results": {
            "color": {
              "identifier": "color",
              "start_date": "2024-07-04T16:21:59.151739",
              "end_date": "2024-07-04T16:21:59.880927",
              "question_title": "What color do you prefer?",
              "results": {}
            }
          }
        };
        final RPTaskResult rpTaskResult = RPTaskResult.fromJson(expectedData);

        Map<String, dynamic> actualData = rpSurveyDataToJson(rpTaskResult);

        expect(actualData['identifier'], isA<String>());
        expect(actualData['start_date'], isA<String>());
        expect(actualData['end_date'], isA<String>());
        expect(actualData['results'], isA<Map>());
      },
    );
  });
  group('buildSurveyItemData', () {
    test(
      """
      given an object that maps from the item identifier to its data of a single
      choice survey item, it returns a SurveyItem object.
      """,
      () {
        /// arrange
        final Map<String, dynamic> jsonItem = {
          "identifier": "color",
          "start_date": "2024-07-04T16:21:59.151739",
          "end_date": "2024-07-04T16:21:59.880927",
          "question_title": "What color do you prefer?",
          "results": {
            "answer": [
              {
                "__type": "RPChoice",
                "text": "Black",
                "value": "0",
                "is_free_text": "false"
              }
            ]
          },
          "answer_format": {
            "__type": "RPChoiceAnswerFormat",
            "question_type": "SingleChoice",
            "choices": [
              {
                "__type": "RPChoice",
                "text": "Black",
                "value": "0",
                "is_free_text": "false"
              },
              {
                "__type": "RPChoice",
                "text": "White",
                "value": "1",
                "is_free_text": "false"
              },
            ],
            "answer_style": "SingleChoice",
          }
        };

        /// act

        /// assert
      },
    );
  });
}
