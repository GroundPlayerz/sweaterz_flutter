// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Search _$_$_SearchFromJson(Map<String, dynamic> json) {
  return _$_Search(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    content: json['content'] as String,
    createdTime: json['created_time'] as String,
  );
}

Map<String, dynamic> _$_$_SearchToJson(_$_Search instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'content': instance.content,
      'created_time': instance.createdTime,
    };
