// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return _Dashboard.fromJson(json);
}

/// @nodoc
class _$DashboardTearOff {
  const _$DashboardTearOff();

  _Dashboard call(
      {required int id,
      required int userId,
      required int calendar,
      required int postStats,
      required int routine,
      required int graph,
      required String createdTime,
      String? updatedTime}) {
    return _Dashboard(
      id: id,
      userId: userId,
      calendar: calendar,
      postStats: postStats,
      routine: routine,
      graph: graph,
      createdTime: createdTime,
      updatedTime: updatedTime,
    );
  }

  Dashboard fromJson(Map<String, Object> json) {
    return Dashboard.fromJson(json);
  }
}

/// @nodoc
const $Dashboard = _$DashboardTearOff();

/// @nodoc
mixin _$Dashboard {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get calendar => throw _privateConstructorUsedError;
  int get postStats => throw _privateConstructorUsedError;
  int get routine => throw _privateConstructorUsedError;
  int get graph => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;
  String? get updatedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int userId,
      int calendar,
      int postStats,
      int routine,
      int graph,
      String createdTime,
      String? updatedTime});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res> implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  final Dashboard _value;
  // ignore: unused_field
  final $Res Function(Dashboard) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? calendar = freezed,
    Object? postStats = freezed,
    Object? routine = freezed,
    Object? graph = freezed,
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
      calendar: calendar == freezed
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as int,
      postStats: postStats == freezed
          ? _value.postStats
          : postStats // ignore: cast_nullable_to_non_nullable
              as int,
      routine: routine == freezed
          ? _value.routine
          : routine // ignore: cast_nullable_to_non_nullable
              as int,
      graph: graph == freezed
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
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
abstract class _$DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(
          _Dashboard value, $Res Function(_Dashboard) then) =
      __$DashboardCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int userId,
      int calendar,
      int postStats,
      int routine,
      int graph,
      String createdTime,
      String? updatedTime});
}

/// @nodoc
class __$DashboardCopyWithImpl<$Res> extends _$DashboardCopyWithImpl<$Res>
    implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(_Dashboard _value, $Res Function(_Dashboard) _then)
      : super(_value, (v) => _then(v as _Dashboard));

  @override
  _Dashboard get _value => super._value as _Dashboard;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? calendar = freezed,
    Object? postStats = freezed,
    Object? routine = freezed,
    Object? graph = freezed,
    Object? createdTime = freezed,
    Object? updatedTime = freezed,
  }) {
    return _then(_Dashboard(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      calendar: calendar == freezed
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as int,
      postStats: postStats == freezed
          ? _value.postStats
          : postStats // ignore: cast_nullable_to_non_nullable
              as int,
      routine: routine == freezed
          ? _value.routine
          : routine // ignore: cast_nullable_to_non_nullable
              as int,
      graph: graph == freezed
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
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
class _$_Dashboard implements _Dashboard {
  _$_Dashboard(
      {required this.id,
      required this.userId,
      required this.calendar,
      required this.postStats,
      required this.routine,
      required this.graph,
      required this.createdTime,
      this.updatedTime});

  factory _$_Dashboard.fromJson(Map<String, dynamic> json) =>
      _$_$_DashboardFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int calendar;
  @override
  final int postStats;
  @override
  final int routine;
  @override
  final int graph;
  @override
  final String createdTime;
  @override
  final String? updatedTime;

  @override
  String toString() {
    return 'Dashboard(id: $id, userId: $userId, calendar: $calendar, postStats: $postStats, routine: $routine, graph: $graph, createdTime: $createdTime, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Dashboard &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.calendar, calendar) ||
                const DeepCollectionEquality()
                    .equals(other.calendar, calendar)) &&
            (identical(other.postStats, postStats) ||
                const DeepCollectionEquality()
                    .equals(other.postStats, postStats)) &&
            (identical(other.routine, routine) ||
                const DeepCollectionEquality()
                    .equals(other.routine, routine)) &&
            (identical(other.graph, graph) ||
                const DeepCollectionEquality().equals(other.graph, graph)) &&
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
      const DeepCollectionEquality().hash(calendar) ^
      const DeepCollectionEquality().hash(postStats) ^
      const DeepCollectionEquality().hash(routine) ^
      const DeepCollectionEquality().hash(graph) ^
      const DeepCollectionEquality().hash(createdTime) ^
      const DeepCollectionEquality().hash(updatedTime);

  @JsonKey(ignore: true)
  @override
  _$DashboardCopyWith<_Dashboard> get copyWith =>
      __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DashboardToJson(this);
  }
}

abstract class _Dashboard implements Dashboard {
  factory _Dashboard(
      {required int id,
      required int userId,
      required int calendar,
      required int postStats,
      required int routine,
      required int graph,
      required String createdTime,
      String? updatedTime}) = _$_Dashboard;

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$_Dashboard.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  int get calendar => throw _privateConstructorUsedError;
  @override
  int get postStats => throw _privateConstructorUsedError;
  @override
  int get routine => throw _privateConstructorUsedError;
  @override
  int get graph => throw _privateConstructorUsedError;
  @override
  String get createdTime => throw _privateConstructorUsedError;
  @override
  String? get updatedTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DashboardCopyWith<_Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}
