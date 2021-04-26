import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int? id;
  final String? email;
  final String? profileName;
  final String? profilePhotoUrl;
  final String? role; //admin, general_free, general_paid, expert
  final String? profileIntroduction;
  final String? createdTime;
  final String? updatedTime; //[nullable : video, sound의 경우에만 생성]
  final String? privacy; //all, follower, none

  User(
      this.id,
      this.email,
      this.profileName,
      this.profilePhotoUrl,
      this.role,
      this.profileIntroduction,
      this.createdTime,
      this.updatedTime,
      this.privacy);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
