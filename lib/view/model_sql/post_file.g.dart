// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostFile _$PostFileFromJson(Map<String, dynamic> json) {
  return PostFile(
    json['id'] as int?,
    json['post_id'] as int?,
    json['type'] as String?,
    json['order'] as int?,
    json['url'] as String?,
    (json['size'] as num?)?.toDouble(),
    (json['length'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$PostFileToJson(PostFile instance) => <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'type': instance.type,
      'order': instance.order,
      'url': instance.url,
      'size': instance.size,
      'length': instance.length,
    };
