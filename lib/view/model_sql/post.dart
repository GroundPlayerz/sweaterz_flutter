import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Post {
  final int? id;
  final int? userId;
  final int? sportsId;
  final String? content;
  final String? isQuestion;
  final String? uploadType; //text, image, video
  final String? postPrivacy; //all, follower, none
  final String? createdTime;
  final String? updatedTime; //[nullable]

  Post(this.id, this.userId, this.sportsId, this.content, this.isQuestion,
      this.uploadType, this.postPrivacy, this.createdTime, this.updatedTime);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
