import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification extends EMAModel with _$Notification {
  const factory Notification({
    required String participantId,
    required String notificationId,
    required String? notificationType,
    required String? title,
    required String? body,
    required DateTime? timeSent,
    required DateTime? timeTapped,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
