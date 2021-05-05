// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Graph _$_$_GraphFromJson(Map<String, dynamic> json) {
  return _$_Graph(
    id: json['id'] as int,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    title: json['title'] as String,
    description: json['description'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    createdTime: json['created_time'] as String,
    order: json['order'] as int,
    updatedTime: json['updated_time'] as String?,
  );
}

Map<String, dynamic> _$_$_GraphToJson(_$_Graph instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'title': instance.title,
      'description': instance.description,
      'data': instance.data,
      'created_time': instance.createdTime,
      'order': instance.order,
      'updated_time': instance.updatedTime,
    };
