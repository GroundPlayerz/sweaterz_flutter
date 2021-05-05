import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_order.freezed.dart';
part 'dashboard_order.g.dart';

@freezed
class DashboardOrder with _$DashboardOrder {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory DashboardOrder({
    required int id,
    required int userId,
    required String type,
    required int order,
    required String createdTime,
    String? updatedTime,
  }) = _DashboardOrder;

  factory DashboardOrder.fromJson(Map<String, dynamic> json) =>
      _$DashboardOrderFromJson(json);
}
