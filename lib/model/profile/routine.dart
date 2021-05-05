import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/model/tag/tag.dart';
import 'package:sweaterz_flutter/model/user/user.dart';

part 'routine.freezed.dart';
part 'routine.g.dart';

@freezed
class Routine with _$Routine {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Routine({
    required int id,
    required User user,
    required User originUser,
    required String title,
    required String description,
    required bool isSelected,
    required int savedCount,
    required List<Tag> tags,
    required Sports sport,
    required String mon,
    required String tue,
    required String wed,
    required String thu,
    required String fri,
    required String sat,
    required String sun,
    required String createdTime,
    String? updatedTime,
  }) = _Routine;

  factory Routine.fromJson(Map<String, dynamic> json) =>
      _$RoutineFromJson(json);
}
