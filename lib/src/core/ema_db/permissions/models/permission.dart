import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/permissions/models/status.dart';

part 'permission.freezed.dart';
part 'permission.g.dart';

@freezed
class Permission extends EMAModel with _$Permission {
  const factory Permission({
    required String participantId,
    required String permissionId,
    required DateTime dateTimeChanged,
    required Status status,
    String? permissionDescription,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}
