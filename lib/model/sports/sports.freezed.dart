// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sports _$SportsFromJson(Map<String, dynamic> json) {
  return _Sports.fromJson(json);
}

/// @nodoc
class _$SportsTearOff {
  const _$SportsTearOff();

  _Sports call({required int id, required String name}) {
    return _Sports(
      id: id,
      name: name,
    );
  }

  Sports fromJson(Map<String, Object> json) {
    return Sports.fromJson(json);
  }
}

/// @nodoc
const $Sports = _$SportsTearOff();

/// @nodoc
mixin _$Sports {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SportsCopyWith<Sports> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SportsCopyWith<$Res> {
  factory $SportsCopyWith(Sports value, $Res Function(Sports) then) =
      _$SportsCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$SportsCopyWithImpl<$Res> implements $SportsCopyWith<$Res> {
  _$SportsCopyWithImpl(this._value, this._then);

  final Sports _value;
  // ignore: unused_field
  final $Res Function(Sports) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SportsCopyWith<$Res> implements $SportsCopyWith<$Res> {
  factory _$SportsCopyWith(_Sports value, $Res Function(_Sports) then) =
      __$SportsCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$SportsCopyWithImpl<$Res> extends _$SportsCopyWithImpl<$Res>
    implements _$SportsCopyWith<$Res> {
  __$SportsCopyWithImpl(_Sports _value, $Res Function(_Sports) _then)
      : super(_value, (v) => _then(v as _Sports));

  @override
  _Sports get _value => super._value as _Sports;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_Sports(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Sports implements _Sports {
  _$_Sports({required this.id, required this.name});

  factory _$_Sports.fromJson(Map<String, dynamic> json) =>
      _$_$_SportsFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Sports(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Sports &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$SportsCopyWith<_Sports> get copyWith =>
      __$SportsCopyWithImpl<_Sports>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SportsToJson(this);
  }
}

abstract class _Sports implements Sports {
  factory _Sports({required int id, required String name}) = _$_Sports;

  factory _Sports.fromJson(Map<String, dynamic> json) = _$_Sports.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SportsCopyWith<_Sports> get copyWith => throw _privateConstructorUsedError;
}
