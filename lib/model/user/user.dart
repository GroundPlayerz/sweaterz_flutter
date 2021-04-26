import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory User({
    required int id,
    required String email,
    required String profileName,
    required String profilePhotoUrl,
    required String role, //admin, general_free, general_paid, expert
    required String profileIntroduction,
    required String createdTime,
    String? updatedTime, //[nullable]
    required String privacy,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json); //all, follower, none
}
