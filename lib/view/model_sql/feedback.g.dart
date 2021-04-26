// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return Feedback(
    json['id'] as int?,
    json['user_id'] as int?,
    json['post_id'] as int?,
    json['created_time'] as String?,
    json['updated_time'] as String?,
    (json['start_time'] as num?)?.toDouble(),
    (json['end_time'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'post_id': instance.postId,
      'created_time': instance.createdTime,
      'updated_time': instance.updatedTime,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
