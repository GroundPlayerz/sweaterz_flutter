// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feedback _$_$_FeedbackFromJson(Map<String, dynamic> json) {
  return _$_Feedback(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    postId: json['post_id'] as int,
    createdTime: json['created_time'] as String,
    isLikeButtonPressed: json['is_like_button_pressed'] as bool,
    feedbackContentList: (json['feedback_content_list'] as List<dynamic>?)
        ?.map((e) => FeedbackContent.fromJson(e as Map<String, dynamic>))
        .toList(),
    feedbackFileList: (json['feedback_file_list'] as List<dynamic>?)
        ?.map((e) => FeedbackFile.fromJson(e as Map<String, dynamic>))
        .toList(),
    updatedTime: json['updated_time'] as String?,
    startTime: (json['start_time'] as num?)?.toDouble(),
    endTime: (json['end_time'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_FeedbackToJson(_$_Feedback instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'post_id': instance.postId,
      'created_time': instance.createdTime,
      'is_like_button_pressed': instance.isLikeButtonPressed,
      'feedback_content_list': instance.feedbackContentList,
      'feedback_file_list': instance.feedbackFileList,
      'updated_time': instance.updatedTime,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

_$_FeedbackContent _$_$_FeedbackContentFromJson(Map<String, dynamic> json) {
  return _$_FeedbackContent(
    id: json['id'] as int,
    feedbackId: json['feedback_id'] as int,
    content: json['content'] as String,
    order: json['order'] as int,
  );
}

Map<String, dynamic> _$_$_FeedbackContentToJson(_$_FeedbackContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedback_id': instance.feedbackId,
      'content': instance.content,
      'order': instance.order,
    };

_$_FeedbackFile _$_$_FeedbackFileFromJson(Map<String, dynamic> json) {
  return _$_FeedbackFile(
    id: json['id'] as int,
    feedbackId: json['feedback_id'] as int,
    type: json['type'] as String,
    order: json['order'] as int,
    url: json['url'] as String,
    size: (json['size'] as num).toDouble(),
    length: (json['length'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_FeedbackFileToJson(_$_FeedbackFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedback_id': instance.feedbackId,
      'type': instance.type,
      'order': instance.order,
      'url': instance.url,
      'size': instance.size,
      'length': instance.length,
    };
