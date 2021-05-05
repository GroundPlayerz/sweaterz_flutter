// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'dashboard_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashboardOrder _$DashboardOrderFromJson(Map<String, dynamic> json) {
  return _DashboardOrder.fromJson(json);
}

/// @nodoc
class _$DashboardOrderTearOff {
  const _$DashboardOrderTearOff();

  _DashboardOrder call(
      {required int id,
      required int userId,
      required String type,
      required int order,
      required String createdTime,
      String? updatedTime}) {
    return _DashboardOrder(
      id: id,
      userId: userId,
      type: type,
      order: order,
      createdTime: createdTime,
      updatedTime: updatedTime,
    );
  }

  DashboardOrder fromJson(Map<String, Object> json) {
    return DashboardOrder.fromJson(json);
  }
}

/// @nodoc
const $DashboardOrder = _$DashboardOrderTearOff();

/// @nodoc
mixin _$DashboardOrder {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;
  String? get updatedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardOrderCopyWith<DashboardOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardOrderCopyWith<$Res> {
  factory $DashboardOrderCopyWith(
          DashboardOrder value, $Res Function(DashboardOrder) then) =
      _$DashboardOrderCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int userId,
      String type,
      int order,
      String createdTime,
      String? updatedTime});
}

/// @nodoc
class _$DashboardOrderCopyWithImpl<$Res>
    implements $DashboardOrderCopyWith<$Res> {
  _$DashboardOrderCopyWithImpl(this._value, this._then);

  final DashboardOrder _value;
  // ignore: unused_field
  final $Res Function(DashboardOrder) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? type = freezed,
    Object? order = freezed,
    Object? createdTime = freezed,
    Object? updatedTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$DashboardOrderCopyWith<$Res>
    implements $DashboardOrderCopyWith<$Res> {
  factory _$DashboardOrderCopyWith(
          _DashboardOrder value, $Res Function(_DashboardOrder) then) =
      __$DashboardOrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int userId,
      String type,
      int order,
      String createdTime,
      String? updatedTime});
}

/// @nodoc
class __$DashboardOrderCopyWithImpl<$Res>
    extends _$DashboardOrderCopyWithImpl<$Res>
    implements _$DashboardOrderCopyWith<$Res> {
  __$DashboardOrderCopyWithImpl(
      _DashboardOrder _value, $Res Function(_DashboardOrder) _then)
      : super(_value, (v) => _then(v as _DashboardOrder));

  @override
  _DashboardOrder get _value => super._value as _DashboardOrder;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? type = freezed,
    Object? order = freezed,
    Object? createdTime = freezed,
    Object? updatedTime = freezed,
  }) {
    return _then(_DashboardOrder(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_DashboardOrder implements _DashboardOrder {
  _$_DashboardOrder(
      {required this.id,
      required this.userId,
      required this.type,
      required this.order,
      required this.createdTime,
      this.updatedTime});

  factory _$_DashboardOrder.fromJson(Map<String, dynamic> json) =>
      _$_$_DashboardOrderFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String type;
  @override
  final int order;
  @override
  final String createdTime;
  @override
  final String? updatedTime;

  @override
  String toString() {
    return 'DashboardOrder(id: $id, userId: $userId, type: $type, order: $order, createdTime: $createdTime, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DashboardOrder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
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
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(createdTime) ^
      const DeepCollectionEquality().hash(updatedTime);

  @JsonKey(ignore: true)
  @override
  _$DashboardOrderCopyWith<_DashboardOrder> get copyWith =>
      __$DashboardOrderCopyWithImpl<_DashboardOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DashboardOrderToJson(this);
  }
}

abstract class _DashboardOrder implements DashboardOrder {
  factory _DashboardOrder(
      {required int id,
      required int userId,
      required String type,
      required int order,
      required String createdTime,
      String? updatedTime}) = _$_DashboardOrder;

  factory _DashboardOrder.fromJson(Map<String, dynamic> json) =
      _$_DashboardOrder.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  int get order => throw _privateConstructorUsedError;
  @override
  String get createdTime => throw _privateConstructorUsedError;
  @override
  String? get updatedTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DashboardOrderCopyWith<_DashboardOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
