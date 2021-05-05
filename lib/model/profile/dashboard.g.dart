// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dashboard _$_$_DashboardFromJson(Map<String, dynamic> json) {
  return _$_Dashboard(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    calendar: json['calendar'] as int,
    postStats: json['post_stats'] as int,
    routine: json['routine'] as int,
    graph: json['graph'] as int,
    createdTime: json['created_time'] as String,
    updatedTime: json['updated_time'] as String?,
  );
}

Map<String, dynamic> _$_$_DashboardToJson(_$_Dashboard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'calendar': instance.calendar,
      'post_stats': instance.postStats,
      'routine': instance.routine,
      'graph': instance.graph,
      'created_time': instance.createdTime,
      'updated_time': instance.updatedTime,
    };
