import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.freezed.dart';
part 'metadata.g.dart';

/// Represents the metadata for an active task's session.
///
/// Sessions
@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    /// Unique identifier for the participant
    required String participantID,

    /// Unique identifier for the current session of the  current participant.
    required String sessionID,

    /// Time at which the session started.
    required DateTime startTime,

    /// Time at which the session ended.
    required DateTime endTime,

    /// Short description of the data.
    required String identifier,

    /// Long description of the data
    required String description,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}
