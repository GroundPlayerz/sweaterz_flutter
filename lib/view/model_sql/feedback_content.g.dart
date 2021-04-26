// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackContent _$FeedbackContentFromJson(Map<String, dynamic> json) {
  return FeedbackContent(
    json['id'] as int?,
    json['feedback_id'] as int?,
    json['content'] as String?,
    json['order'] as int?,
  );
}

Map<String, dynamic> _$FeedbackContentToJson(FeedbackContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedback_id': instance.feedbackId,
      'content': instance.content,
      'order': instance.order,
    };
