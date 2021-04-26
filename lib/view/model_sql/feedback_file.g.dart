// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackFile _$FeedbackFileFromJson(Map<String, dynamic> json) {
  return FeedbackFile(
    json['id'] as int?,
    json['feedback_id'] as int?,
    json['type'] as String?,
    json['order'] as int?,
    json['url'] as String?,
    (json['size'] as num?)?.toDouble(),
    (json['length'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$FeedbackFileToJson(FeedbackFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedback_id': instance.feedbackId,
      'type': instance.type,
      'order': instance.order,
      'url': instance.url,
      'size': instance.size,
      'length': instance.length,
    };
