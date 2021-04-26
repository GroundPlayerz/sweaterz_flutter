// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int?,
    json['email'] as String?,
    json['profile_name'] as String?,
    json['profile_photo_url'] as String?,
    json['role'] as String?,
    json['profile_introduction'] as String?,
    json['created_time'] as String?,
    json['updated_time'] as String?,
    json['privacy'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'profile_name': instance.profileName,
      'profile_photo_url': instance.profilePhotoUrl,
      'role': instance.role,
      'profile_introduction': instance.profileIntroduction,
      'created_time': instance.createdTime,
      'updated_time': instance.updatedTime,
      'privacy': instance.privacy,
    };
