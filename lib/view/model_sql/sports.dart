import 'package:json_annotation/json_annotation.dart';
part 'sports.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Sports {
  final int? id;
  final String? name;

  Sports(this.id, this.name);

  factory Sports.fromJson(Map<String, dynamic> json) => _$SportsFromJson(json);
  Map<String, dynamic> toJson() => _$SportsToJson(this);
}
