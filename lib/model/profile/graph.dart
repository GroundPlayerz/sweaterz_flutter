import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sweaterz_flutter/model/user/user.dart';

part 'graph.freezed.dart';
part 'graph.g.dart';

@freezed
class Graph with _$Graph {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Graph({
    required int id,
    required User user,
    required String title,
    required String description,
    required List<GraphData> data,
    required String createdTime,
    required int order,
    String? updatedTime,
  }) = _Graph;

  factory Graph.fromJson(Map<String, dynamic> json) => _$GraphFromJson(json);
}

@freezed
class GraphData with _$GraphData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory GraphData({
    required String date,
    required double value,
    required String description,
  }) = _GraphData;

  factory GraphData.fromJson(Map<String, dynamic> json) =>
      _$GraphDataFromJson(json);
}
