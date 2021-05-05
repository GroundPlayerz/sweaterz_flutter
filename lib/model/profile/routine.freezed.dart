// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'routine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Routine _$RoutineFromJson(Map<String, dynamic> json) {
  return _Routine.fromJson(json);
}

/// @nodoc
class _$RoutineTearOff {
  const _$RoutineTearOff();

  _Routine call(
      {required int id,
      required User user,
      required User originUser,
      required String title,
      required String description,
      required bool isSelected,
      required int savedCount,
      required String mon,
      required String tue,
      required String wed,
      required String thu,
      required String fri,
      required String sat,
      required String sun,
      required String createdTime,
      String? updatedTime}) {
    return _Routine(
      id: id,
      user: user,
      originUser: originUser,
      title: title,
      description: description,
      isSelected: isSelected,
      savedCount: savedCount,
      mon: mon,
      tue: tue,
      wed: wed,
      thu: thu,
      fri: fri,
      sat: sat,
      sun: sun,
      createdTime: createdTime,
      updatedTime: updatedTime,
    );
  }

  Routine fromJson(Map<String, Object> json) {
    return Routine.fromJson(json);
  }
}

/// @nodoc
const $Routine = _$RoutineTearOff();

/// @nodoc
mixin _$Routine {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  User get originUser => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  int get savedCount => throw _privateConstructorUsedError;
  String get mon => throw _privateConstructorUsedError;
  String get tue => throw _privateConstructorUsedError;
  String get wed => throw _privateConstructorUsedError;
  String get thu => throw _privateConstructorUsedError;
  String get fri => throw _privateConstructorUsedError;
  String get sat => throw _privateConstructorUsedError;
  String get sun => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;
  String? get updatedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutineCopyWith<Routine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineCopyWith<$Res> {
  factory $RoutineCopyWith(Routine value, $Res Function(Routine) then) =
      _$RoutineCopyWithImpl<$Res>;
  $Res call(
      {int id,
      User user,
      User originUser,
      String title,
      String description,
      bool isSelected,
      int savedCount,
      String mon,
      String tue,
      String wed,
      String thu,
      String fri,
      String sat,
      String sun,
      String createdTime,
      String? updatedTime});

  $UserCopyWith<$Res> get user;
  $UserCopyWith<$Res> get originUser;
}

/// @nodoc
class _$RoutineCopyWithImpl<$Res> implements $RoutineCopyWith<$Res> {
  _$RoutineCopyWithImpl(this._value, this._then);

  final Routine _value;
  // ignore: unused_field
  final $Res Function(Routine) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? originUser = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isSelected = freezed,
    Object? savedCount = freezed,
    Object? mon = freezed,
    Object? tue = freezed,
    Object? wed = freezed,
    Object? thu = freezed,
    Object? fri = freezed,
    Object? sat = freezed,
    Object? sun = freezed,
    Object? createdTime = freezed,
    Object? updatedTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      originUser: originUser == freezed
          ? _value.originUser
          : originUser // ignore: cast_nullable_to_non_nullable
              as User,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      savedCount: savedCount == freezed
          ? _value.savedCount
          : savedCount // ignore: cast_nullable_to_non_nullable
              as int,
      mon: mon == freezed
          ? _value.mon
          : mon // ignore: cast_nullable_to_non_nullable
              as String,
      tue: tue == freezed
          ? _value.tue
          : tue // ignore: cast_nullable_to_non_nullable
              as String,
      wed: wed == freezed
          ? _value.wed
          : wed // ignore: cast_nullable_to_non_nullable
              as String,
      thu: thu == freezed
          ? _value.thu
          : thu // ignore: cast_nullable_to_non_nullable
              as String,
      fri: fri == freezed
          ? _value.fri
          : fri // ignore: cast_nullable_to_non_nullable
              as String,
      sat: sat == freezed
          ? _value.sat
          : sat // ignore: cast_nullable_to_non_nullable
              as String,
      sun: sun == freezed
          ? _value.sun
          : sun // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $UserCopyWith<$Res> get originUser {
    return $UserCopyWith<$Res>(_value.originUser, (value) {
      return _then(_value.copyWith(originUser: value));
    });
  }
}

/// @nodoc
abstract class _$RoutineCopyWith<$Res> implements $RoutineCopyWith<$Res> {
  factory _$RoutineCopyWith(_Routine value, $Res Function(_Routine) then) =
      __$RoutineCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      User user,
      User originUser,
      String title,
      String description,
      bool isSelected,
      int savedCount,
      String mon,
      String tue,
      String wed,
      String thu,
      String fri,
      String sat,
      String sun,
      String createdTime,
      String? updatedTime});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $UserCopyWith<$Res> get originUser;
}

/// @nodoc
class __$RoutineCopyWithImpl<$Res> extends _$RoutineCopyWithImpl<$Res>
    implements _$RoutineCopyWith<$Res> {
  __$RoutineCopyWithImpl(_Routine _value, $Res Function(_Routine) _then)
      : super(_value, (v) => _then(v as _Routine));

  @override
  _Routine get _value => super._value as _Routine;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? originUser = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isSelected = freezed,
    Object? savedCount = freezed,
    Object? mon = freezed,
    Object? tue = freezed,
    Object? wed = freezed,
    Object? thu = freezed,
    Object? fri = freezed,
    Object? sat = freezed,
    Object? sun = freezed,
    Object? createdTime = freezed,
    Object? updatedTime = freezed,
  }) {
    return _then(_Routine(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      originUser: originUser == freezed
          ? _value.originUser
          : originUser // ignore: cast_nullable_to_non_nullable
              as User,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      savedCount: savedCount == freezed
          ? _value.savedCount
          : savedCount // ignore: cast_nullable_to_non_nullable
              as int,
      mon: mon == freezed
          ? _value.mon
          : mon // ignore: cast_nullable_to_non_nullable
              as String,
      tue: tue == freezed
          ? _value.tue
          : tue // ignore: cast_nullable_to_non_nullable
              as String,
      wed: wed == freezed
          ? _value.wed
          : wed // ignore: cast_nullable_to_non_nullable
              as String,
      thu: thu == freezed
          ? _value.thu
          : thu // ignore: cast_nullable_to_non_nullable
              as String,
      fri: fri == freezed
          ? _value.fri
          : fri // ignore: cast_nullable_to_non_nullable
              as String,
      sat: sat == freezed
          ? _value.sat
          : sat // ignore: cast_nullable_to_non_nullable
              as String,
      sun: sun == freezed
          ? _value.sun
          : sun // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Routine implements _Routine {
  _$_Routine(
      {required this.id,
      required this.user,
      required this.originUser,
      required this.title,
      required this.description,
      required this.isSelected,
      required this.savedCount,
      required this.mon,
      required this.tue,
      required this.wed,
      required this.thu,
      required this.fri,
      required this.sat,
      required this.sun,
      required this.createdTime,
      this.updatedTime});

  factory _$_Routine.fromJson(Map<String, dynamic> json) =>
      _$_$_RoutineFromJson(json);

  @override
  final int id;
  @override
  final User user;
  @override
  final User originUser;
  @override
  final String title;
  @override
  final String description;
  @override
  final bool isSelected;
  @override
  final int savedCount;
  @override
  final String mon;
  @override
  final String tue;
  @override
  final String wed;
  @override
  final String thu;
  @override
  final String fri;
  @override
  final String sat;
  @override
  final String sun;
  @override
  final String createdTime;
  @override
  final String? updatedTime;

  @override
  String toString() {
    return 'Routine(id: $id, user: $user, originUser: $originUser, title: $title, description: $description, isSelected: $isSelected, savedCount: $savedCount, mon: $mon, tue: $tue, wed: $wed, thu: $thu, fri: $fri, sat: $sat, sun: $sun, createdTime: $createdTime, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Routine &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.originUser, originUser) ||
                const DeepCollectionEquality()
                    .equals(other.originUser, originUser)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.isSelected, isSelected) ||
                const DeepCollectionEquality()
                    .equals(other.isSelected, isSelected)) &&
            (identical(other.savedCount, savedCount) ||
                const DeepCollectionEquality()
                    .equals(other.savedCount, savedCount)) &&
            (identical(other.mon, mon) ||
                const DeepCollectionEquality().equals(other.mon, mon)) &&
            (identical(other.tue, tue) ||
                const DeepCollectionEquality().equals(other.tue, tue)) &&
            (identical(other.wed, wed) ||
                const DeepCollectionEquality().equals(other.wed, wed)) &&
            (identical(other.thu, thu) ||
                const DeepCollectionEquality().equals(other.thu, thu)) &&
            (identical(other.fri, fri) ||
                const DeepCollectionEquality().equals(other.fri, fri)) &&
            (identical(other.sat, sat) ||
                const DeepCollectionEquality().equals(other.sat, sat)) &&
            (identical(other.sun, sun) ||
                const DeepCollectionEquality().equals(other.sun, sun)) &&
            (identical(other.createdTime, createdTime) ||
                const DeepCollectionEquality()
                    .equals(other.createdTime, createdTime)) &&
            (identical(other.updatedTime, updatedTime) ||
                const DeepCollectionEquality()
                    .equals(other.updatedTime, updatedTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(originUser) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(isSelected) ^
      const DeepCollectionEquality().hash(savedCount) ^
      const DeepCollectionEquality().hash(mon) ^
      const DeepCollectionEquality().hash(tue) ^
      const DeepCollectionEquality().hash(wed) ^
      const DeepCollectionEquality().hash(thu) ^
      const DeepCollectionEquality().hash(fri) ^
      const DeepCollectionEquality().hash(sat) ^
      const DeepCollectionEquality().hash(sun) ^
      const DeepCollectionEquality().hash(createdTime) ^
      const DeepCollectionEquality().hash(updatedTime);

  @JsonKey(ignore: true)
  @override
  _$RoutineCopyWith<_Routine> get copyWith =>
      __$RoutineCopyWithImpl<_Routine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RoutineToJson(this);
  }
}

abstract class _Routine implements Routine {
  factory _Routine(
      {required int id,
      required User user,
      required User originUser,
      required String title,
      required String description,
      required bool isSelected,
      required int savedCount,
      required String mon,
      required String tue,
      required String wed,
      required String thu,
      required String fri,
      required String sat,
      required String sun,
      required String createdTime,
      String? updatedTime}) = _$_Routine;

  factory _Routine.fromJson(Map<String, dynamic> json) = _$_Routine.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  User get user => throw _privateConstructorUsedError;
  @override
  User get originUser => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  bool get isSelected => throw _privateConstructorUsedError;
  @override
  int get savedCount => throw _privateConstructorUsedError;
  @override
  String get mon => throw _privateConstructorUsedError;
  @override
  String get tue => throw _privateConstructorUsedError;
  @override
  String get wed => throw _privateConstructorUsedError;
  @override
  String get thu => throw _privateConstructorUsedError;
  @override
  String get fri => throw _privateConstructorUsedError;
  @override
  String get sat => throw _privateConstructorUsedError;
  @override
  String get sun => throw _privateConstructorUsedError;
  @override
  String get createdTime => throw _privateConstructorUsedError;
  @override
  String? get updatedTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoutineCopyWith<_Routine> get copyWith =>
      throw _privateConstructorUsedError;
}
