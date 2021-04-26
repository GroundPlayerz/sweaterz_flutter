// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    sportsId: json['sports_id'] as int,
    content: json['content'] as String,
    isQuestion: json['is_question'] as String,
    uploadType: json['upload_type'] as String,
    postPrivacy: json['post_privacy'] as String,
    createdTime: json['created_time'] as String,
    postFileList: (json['post_file_list'] as List<dynamic>?)
        ?.map((e) => PostFile.fromJson(e as Map<String, dynamic>))
        .toList(),
    isLikeButtonPressed: json['is_like_button_pressed'] as bool,
    updatedTime: json['updated_time'] as String?,
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'sports_id': instance.sportsId,
      'content': instance.content,
      'is_question': instance.isQuestion,
      'upload_type': instance.uploadType,
      'post_privacy': instance.postPrivacy,
      'created_time': instance.createdTime,
      'post_file_list': instance.postFileList,
      'is_like_button_pressed': instance.isLikeButtonPressed,
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
