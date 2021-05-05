// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashboardOrder _$_$_DashboardOrderFromJson(Map<String, dynamic> json) {
  return _$_DashboardOrder(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    type: json['type'] as String,
    order: json['order'] as int,
    createdTime: json['created_time'] as String,
    updatedTime: json['updated_time'] as String?,
  );
}

Map<String, dynamic> _$_$_DashboardOrderToJson(_$_DashboardOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'type': instance.type,
      'order': instance.order,
      'created_time': instance.createdTime,
      'updated_time': instance.updatedTime,
    };
