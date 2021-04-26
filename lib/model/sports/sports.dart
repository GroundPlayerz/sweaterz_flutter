import 'package:freezed_annotation/freezed_annotation.dart';

part 'sports.freezed.dart';
part 'sports.g.dart';

@freezed
class Sports with _$Sports {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Sports({
    required int id,
    required String name,
  }) = _Sports;

  factory Sports.fromJson(Map<String, dynamic> json) => _$SportsFromJson(json);
}
