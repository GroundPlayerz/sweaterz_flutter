// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    id: json['id'] as int,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    sport: Sports.fromJson(json['sport'] as Map<String, dynamic>),
    content: json['content'] as String,
    isQuestion: json['is_question'] as String,
    uploadType: json['upload_type'] as String,
    createdTime: json['created_time'] as String,
    tags: (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    likeCount: json['like_count'] as int,
    viewCount: json['view_count'] as int,
    feedbackCount: json['feedback_count'] as int,
    isLikeButtonPressed: json['is_like_button_pressed'] as bool,
    postFileList: (json['post_file_list'] as List<dynamic>?)
        ?.map((e) => PostFile.fromJson(e as Map<String, dynamic>))
        .toList(),
    updatedTime: json['updated_time'] as String?,
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'sport': instance.sport,
      'content': instance.content,
      'is_question': instance.isQuestion,
      'upload_type': instance.uploadType,
      'created_time': instance.createdTime,
      'tags': instance.tags,
      'like_count': instance.likeCount,
      'view_count': instance.viewCount,
      'feedback_count': instance.feedbackCount,
      'is_like_button_pressed': instance.isLikeButtonPressed,
      'post_file_list': instance.postFileList,
      'updated_time': instance.updatedTime,
    };

_$_PostFile _$_$_PostFileFromJson(Map<String, dynamic> json) {
  return _$_PostFile(
    id: json['id'] as int,
    postId: json['post_id'] as int,
    type: json['type'] as String,
    order: json['order'] as int,
    url: json['url'] as String,
    size: (json['size'] as num).toDouble(),
    length: (json['length'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_PostFileToJson(_$_PostFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'type': instance.type,
      'order': instance.order,
      'url': instance.url,
      'size': instance.size,
      'length': instance.length,
    };
