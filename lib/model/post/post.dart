import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Post({
    required int id,
    required int userId,
    required int sportsId,
    required String content,
    required String isQuestion,
    required String uploadType, //text, image, video
    required String postPrivacy, //all, follower, none
    required String createdTime,
    required int likeCount,
    required int viewCount,
    required int feedbackCount,
    required bool isLikeButtonPressed,
    List<PostFile>? postFileList,
    String? updatedTime, //[nullable]
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class PostFile with _$PostFile {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory PostFile({
    required int id,
    required int postId,
    required String type, //video, image, sound
    required int order,
    required String url,
    required double size,
    double? length,
  }) = _PostFile;

  factory PostFile.fromJson(Map<String, dynamic> json) =>
      _$PostFileFromJson(json);
}
