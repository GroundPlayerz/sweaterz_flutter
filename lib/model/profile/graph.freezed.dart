// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Graph _$GraphFromJson(Map<String, dynamic> json) {
  return _Graph.fromJson(json);
}

/// @nodoc
class _$GraphTearOff {
  const _$GraphTearOff();

  _Graph call(
      {required int id,
      required User user,
      required String title,
      required String description,
      required List<GraphData> data,
      required String createdTime,
      required int order,
      String? updatedTime}) {
    return _Graph(
      id: id,
      user: user,
      title: title,
      description: description,
      data: data,
      createdTime: createdTime,
      order: order,
      updatedTime: updatedTime,
    );
  }

  Graph fromJson(Map<String, Object> json) {
    return Graph.fromJson(json);
  }
}

/// @nodoc
const $Graph = _$GraphTearOff();

/// @nodoc
mixin _$Graph {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<GraphData> get data => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String? get updatedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraphCopyWith<Graph> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphCopyWith<$Res> {
  factory $GraphCopyWith(Graph value, $Res Function(Graph) then) =
      _$GraphCopyWithImpl<$Res>;
  $Res call(
      {int id,
      User user,
      String title,
      String description,
      List<GraphData> data,
      String createdTime,
      int order,
      String? updatedTime});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$GraphCopyWithImpl<$Res> implements $GraphCopyWith<$Res> {
  _$GraphCopyWithImpl(this._value, this._then);

  final Graph _value;
  // ignore: unused_field
  final $Res Function(Graph) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? data = freezed,
    Object? createdTime = freezed,
    Object? order = freezed,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GraphData>,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
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
}

/// @nodoc
abstract class _$GraphCopyWith<$Res> implements $GraphCopyWith<$Res> {
  factory _$GraphCopyWith(_Graph value, $Res Function(_Graph) then) =
      __$GraphCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      User user,
      String title,
      String description,
      List<GraphData> data,
      String createdTime,
      int order,
      String? updatedTime});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$GraphCopyWithImpl<$Res> extends _$GraphCopyWithImpl<$Res>
    implements _$GraphCopyWith<$Res> {
  __$GraphCopyWithImpl(_Graph _value, $Res Function(_Graph) _then)
      : super(_value, (v) => _then(v as _Graph));

  @override
  _Graph get _value => super._value as _Graph;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? data = freezed,
    Object? createdTime = freezed,
    Object? order = freezed,
    Object? updatedTime = freezed,
  }) {
    return _then(_Graph(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GraphData>,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Graph implements _Graph {
  _$_Graph(
      {required this.id,
      required this.user,
      required this.title,
      required this.description,
      required this.data,
      required this.createdTime,
      required this.order,
      this.updatedTime});

  factory _$_Graph.fromJson(Map<String, dynamic> json) =>
      _$_$_GraphFromJson(json);

  @override
  final int id;
  @override
  final User user;
  @override
  final String title;
  @override
  final String description;
  @override
  final List<GraphData> data;
  @override
  final String createdTime;
  @override
  final int order;
  @override
  final String? updatedTime;

  @override
  String toString() {
    return 'Graph(id: $id, user: $user, title: $title, description: $description, data: $data, createdTime: $createdTime, order: $order, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Graph &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.createdTime, createdTime) ||
                const DeepCollectionEquality()
                    .equals(other.createdTime, createdTime)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.updatedTime, updatedTime) ||
                const DeepCollectionEquality()
                    .equals(other.updatedTime, updatedTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(createdTime) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(updatedTime);

  @JsonKey(ignore: true)
  @override
  _$GraphCopyWith<_Graph> get copyWith =>
      __$GraphCopyWithImpl<_Graph>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GraphToJson(this);
  }
}

abstract class _Graph implements Graph {
  factory _Graph(
      {required int id,
      required User user,
      required String title,
      required String description,
      required List<GraphData> data,
      required String createdTime,
      required int order,
      String? updatedTime}) = _$_Graph;

  factory _Graph.fromJson(Map<String, dynamic> json) = _$_Graph.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  User get user => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  List<GraphData> get data => throw _privateConstructorUsedError;
  @override
  String get createdTime => throw _privateConstructorUsedError;
  @override
  int get order => throw _privateConstructorUsedError;
  @override
  String? get updatedTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GraphCopyWith<_Graph> get copyWith => throw _privateConstructorUsedError;
}

GraphData _$GraphDataFromJson(Map<String, dynamic> json) {
  return _GraphData.fromJson(json);
}

/// @nodoc
class _$GraphDataTearOff {
  const _$GraphDataTearOff();

  _GraphData call(
      {required String date,
      required double value,
      required String description}) {
    return _GraphData(
      date: date,
      value: value,
      description: description,
    );
  }

  GraphData fromJson(Map<String, Object> json) {
    return GraphData.fromJson(json);
  }
}

/// @nodoc
const $GraphData = _$GraphDataTearOff();

/// @nodoc
mixin _$GraphData {
  String get date => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraphDataCopyWith<GraphData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphDataCopyWith<$Res> {
  factory $GraphDataCopyWith(GraphData value, $Res Function(GraphData) then) =
      _$GraphDataCopyWithImpl<$Res>;
  $Res call({String date, double value, String description});
}

/// @nodoc
class _$GraphDataCopyWithImpl<$Res> implements $GraphDataCopyWith<$Res> {
  _$GraphDataCopyWithImpl(this._value, this._then);

  final GraphData _value;
  // ignore: unused_field
  final $Res Function(GraphData) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? value = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GraphDataCopyWith<$Res> implements $GraphDataCopyWith<$Res> {
  factory _$GraphDataCopyWith(
          _GraphData value, $Res Function(_GraphData) then) =
      __$GraphDataCopyWithImpl<$Res>;
  @override
  $Res call({String date, double value, String description});
}

/// @nodoc
class __$GraphDataCopyWithImpl<$Res> extends _$GraphDataCopyWithImpl<$Res>
    implements _$GraphDataCopyWith<$Res> {
  __$GraphDataCopyWithImpl(_GraphData _value, $Res Function(_GraphData) _then)
      : super(_value, (v) => _then(v as _GraphData));

  @override
  _GraphData get _value => super._value as _GraphData;

  @override
  $Res call({
    Object? date = freezed,
    Object? value = freezed,
    Object? description = freezed,
  }) {
    return _then(_GraphData(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_GraphData implements _GraphData {
  _$_GraphData(
      {required this.date, required this.value, required this.description});

  factory _$_GraphData.fromJson(Map<String, dynamic> json) =>
      _$_$_GraphDataFromJson(json);

  @override
  final String date;
  @override
  final double value;
  @override
  final String description;

  @override
  String toString() {
    return 'GraphData(date: $date, value: $value, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GraphData &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$GraphDataCopyWith<_GraphData> get copyWith =>
      __$GraphDataCopyWithImpl<_GraphData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GraphDataToJson(this);
  }
}

abstract class _GraphData implements GraphData {
  factory _GraphData(
      {required String date,
      required double value,
      required String description}) = _$_GraphData;

  factory _GraphData.fromJson(Map<String, dynamic> json) =
      _$_GraphData.fromJson;

  @override
  String get date => throw _privateConstructorUsedError;
  @override
  double get value => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GraphDataCopyWith<_GraphData> get copyWith =>
      throw _privateConstructorUsedError;
}
