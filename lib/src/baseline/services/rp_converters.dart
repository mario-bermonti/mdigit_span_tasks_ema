/// Format the answer to an [RPQuestion].
/// Currently supports Date and SingleChoice questions.
String getAnswer({
  required Iterable<dynamic> rpAnswer,
  required String itemType,
}) {
  if (itemType == 'Date') {
    return rpAnswer.first;
  } else if (itemType == 'SingleChoice') {
    return rpAnswer.first.text as String;
  } else {
    throw UnimplementedError('Support for $itemType has not been implemented');
  }
}
