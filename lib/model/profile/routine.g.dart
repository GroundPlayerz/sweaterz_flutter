// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Routine _$_$_RoutineFromJson(Map<String, dynamic> json) {
  return _$_Routine(
    id: json['id'] as int,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    originUser: User.fromJson(json['origin_user'] as Map<String, dynamic>),
    title: json['title'] as String,
    description: json['description'] as String,
    isSelected: json['is_selected'] as bool,
    savedCount: json['saved_count'] as int,
    tags: (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    sport: Sports.fromJson(json['sport'] as Map<String, dynamic>),
    mon: json['mon'] as String,
    tue: json['tue'] as String,
    wed: json['wed'] as String,
    thu: json['thu'] as String,
    fri: json['fri'] as String,
    sat: json['sat'] as String,
    sun: json['sun'] as String,
    createdTime: json['created_time'] as String,
    updatedTime: json['updated_time'] as String?,
  );
}

Map<String, dynamic> _$_$_RoutineToJson(_$_Routine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'origin_user': instance.originUser,
      'title': instance.title,
      'description': instance.description,
      'is_selected': instance.isSelected,
      'saved_count': instance.savedCount,
      'tags': instance.tags,
      'sport': instance.sport,
      'mon': instance.mon,
      'tue': instance.tue,
      'wed': instance.wed,
      'thu': instance.thu,
      'fri': instance.fri,
      'sat': instance.sat,
      'sun': instance.sun,
      'created_time': instance.createdTime,
      'updated_time': instance.updatedTime,
    };
