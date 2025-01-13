import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant.freezed.dart';
part 'participant.g.dart';

@freezed
class Participant with _$Participant {
  const factory Participant({
    required String id,
    List<String>? notificationTokens,
    String? nickname,
    String? location,
    String? timezone,
    String? locale,
    String? appVersion,
    String? appBuildNumber,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}
