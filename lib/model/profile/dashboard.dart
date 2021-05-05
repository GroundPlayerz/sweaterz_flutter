import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

@freezed
class Dashboard with _$Dashboard {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Dashboard({
    required int id,
    required int userId,
    required int calendar,
    required int postStats,
    required int routine,
    required int graph,
    required String createdTime,
    String? updatedTime,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}
