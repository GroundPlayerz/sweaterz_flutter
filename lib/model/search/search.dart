import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
class Search with _$Search {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Search({
    required int id,
    required int userId,
    required String content,
    required String createdTime,
  }) = _Search;

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
}
