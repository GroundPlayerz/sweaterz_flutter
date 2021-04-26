// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    json['id'] as int?,
    json['user_id'] as int?,
    json['sports_id'] as int?,
    json['content'] as String?,
    json['is_question'] as String?,
    json['upload_type'] as String?,
    json['post_privacy'] as String?,
    json['created_time'] as String?,
    json['updated_time'] as String?,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'sports_id': instance.sportsId,
      'content': instance.content,
      'is_question': instance.isQuestion,
      'upload_type': instance.uploadType,
      'post_privacy': instance.postPrivacy,
      'created_time': instance.createdTime,
      'updated_time': instance.updatedTime,
    };
