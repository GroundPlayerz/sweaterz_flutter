// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return _Feedback.fromJson(json);
}

/// @nodoc
class _$FeedbackTearOff {
  const _$FeedbackTearOff();

  _Feedback call(
      {required int id,
      required int userId,
      required int postId,
      required String createdTime,
      required bool isLikeButtonPressed,
      List<FeedbackContent>? feedbackContentList,
      List<FeedbackFile>? feedbackFileList,
      String? updatedTime,
      double? startTime,
      double? endTime}) {
    return _Feedback(
      id: id,
      userId: userId,
      postId: postId,
      createdTime: createdTime,
      isLikeButtonPressed: isLikeButtonPressed,
      feedbackContentList: feedbackContentList,
      feedbackFileList: feedbackFileList,
      updatedTime: updatedTime,
      startTime: startTime,
      endTime: endTime,
    );
  }

  Feedback fromJson(Map<String, Object> json) {
    return Feedback.fromJson(json);
  }
}

/// @nodoc
const $Feedback = _$FeedbackTearOff();

/// @nodoc
mixin _$Feedback {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get createdTime => throw _privateConstructorUsedError;
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  List<FeedbackContent>? get feedbackContentList =>
      throw _privateConstructorUsedError;
  List<FeedbackFile>? get feedbackFileList =>
      throw _privateConstructorUsedError;
  String? get updatedTime => throw _privateConstructorUsedError; //[nullable]
  double? get startTime => throw _privateConstructorUsedError; //[nullable]
  double? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackCopyWith<Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackCopyWith<$Res> {
  factory $FeedbackCopyWith(Feedback value, $Res Function(Feedback) then) =
      _$FeedbackCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int userId,
      int postId,
      String createdTime,
      bool isLikeButtonPressed,
      List<FeedbackContent>? feedbackContentList,
      List<FeedbackFile>? feedbackFileList,
      String? updatedTime,
      double? startTime,
      double? endTime});
}

/// @nodoc
class _$FeedbackCopyWithImpl<$Res> implements $FeedbackCopyWith<$Res> {
  _$FeedbackCopyWithImpl(this._value, this._then);

  final Feedback _value;
  // ignore: unused_field
  final $Res Function(Feedback) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? postId = freezed,
    Object? createdTime = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? feedbackContentList = freezed,
    Object? feedbackFileList = freezed,
    Object? updatedTime = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
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
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      feedbackContentList: feedbackContentList == freezed
          ? _value.feedbackContentList
          : feedbackContentList // ignore: cast_nullable_to_non_nullable
              as List<FeedbackContent>?,
      feedbackFileList: feedbackFileList == freezed
          ? _value.feedbackFileList
          : feedbackFileList // ignore: cast_nullable_to_non_nullable
              as List<FeedbackFile>?,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as double?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$FeedbackCopyWith<$Res> implements $FeedbackCopyWith<$Res> {
  factory _$FeedbackCopyWith(_Feedback value, $Res Function(_Feedback) then) =
      __$FeedbackCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int userId,
      int postId,
      String createdTime,
      bool isLikeButtonPressed,
      List<FeedbackContent>? feedbackContentList,
      List<FeedbackFile>? feedbackFileList,
      String? updatedTime,
      double? startTime,
      double? endTime});
}

/// @nodoc
class __$FeedbackCopyWithImpl<$Res> extends _$FeedbackCopyWithImpl<$Res>
    implements _$FeedbackCopyWith<$Res> {
  __$FeedbackCopyWithImpl(_Feedback _value, $Res Function(_Feedback) _then)
      : super(_value, (v) => _then(v as _Feedback));

  @override
  _Feedback get _value => super._value as _Feedback;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? postId = freezed,
    Object? createdTime = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? feedbackContentList = freezed,
    Object? feedbackFileList = freezed,
    Object? updatedTime = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_Feedback(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      feedbackContentList: feedbackContentList == freezed
          ? _value.feedbackContentList
          : feedbackContentList // ignore: cast_nullable_to_non_nullable
              as List<FeedbackContent>?,
      feedbackFileList: feedbackFileList == freezed
          ? _value.feedbackFileList
          : feedbackFileList // ignore: cast_nullable_to_non_nullable
              as List<FeedbackFile>?,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as double?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Feedback implements _Feedback {
  _$_Feedback(
      {required this.id,
      required this.userId,
      required this.postId,
      required this.createdTime,
      required this.isLikeButtonPressed,
      this.feedbackContentList,
      this.feedbackFileList,
      this.updatedTime,
      this.startTime,
      this.endTime});

  factory _$_Feedback.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedbackFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int postId;
  @override
  final String createdTime;
  @override
  final bool isLikeButtonPressed;
  @override
  final List<FeedbackContent>? feedbackContentList;
  @override
  final List<FeedbackFile>? feedbackFileList;
  @override
  final String? updatedTime;
  @override //[nullable]
  final double? startTime;
  @override //[nullable]
  final double? endTime;

  @override
  String toString() {
    return 'Feedback(id: $id, userId: $userId, postId: $postId, createdTime: $createdTime, isLikeButtonPressed: $isLikeButtonPressed, feedbackContentList: $feedbackContentList, feedbackFileList: $feedbackFileList, updatedTime: $updatedTime, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Feedback &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.createdTime, createdTime) ||
                const DeepCollectionEquality()
                    .equals(other.createdTime, createdTime)) &&
            (identical(other.isLikeButtonPressed, isLikeButtonPressed) ||
                const DeepCollectionEquality()
                    .equals(other.isLikeButtonPressed, isLikeButtonPressed)) &&
            (identical(other.feedbackContentList, feedbackContentList) ||
                const DeepCollectionEquality()
                    .equals(other.feedbackContentList, feedbackContentList)) &&
            (identical(other.feedbackFileList, feedbackFileList) ||
                const DeepCollectionEquality()
                    .equals(other.feedbackFileList, feedbackFileList)) &&
            (identical(other.updatedTime, updatedTime) ||
                const DeepCollectionEquality()
                    .equals(other.updatedTime, updatedTime)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality().equals(other.endTime, endTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(createdTime) ^
      const DeepCollectionEquality().hash(isLikeButtonPressed) ^
      const DeepCollectionEquality().hash(feedbackContentList) ^
      const DeepCollectionEquality().hash(feedbackFileList) ^
      const DeepCollectionEquality().hash(updatedTime) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime);

  @JsonKey(ignore: true)
  @override
  _$FeedbackCopyWith<_Feedback> get copyWith =>
      __$FeedbackCopyWithImpl<_Feedback>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedbackToJson(this);
  }
}

abstract class _Feedback implements Feedback {
  factory _Feedback(
      {required int id,
      required int userId,
      required int postId,
      required String createdTime,
      required bool isLikeButtonPressed,
      List<FeedbackContent>? feedbackContentList,
      List<FeedbackFile>? feedbackFileList,
      String? updatedTime,
      double? startTime,
      double? endTime}) = _$_Feedback;

  factory _Feedback.fromJson(Map<String, dynamic> json) = _$_Feedback.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  String get createdTime => throw _privateConstructorUsedError;
  @override
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  @override
  List<FeedbackContent>? get feedbackContentList =>
      throw _privateConstructorUsedError;
  @override
  List<FeedbackFile>? get feedbackFileList =>
      throw _privateConstructorUsedError;
  @override
  String? get updatedTime => throw _privateConstructorUsedError;
  @override //[nullable]
  double? get startTime => throw _privateConstructorUsedError;
  @override //[nullable]
  double? get endTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeedbackCopyWith<_Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedbackContent _$FeedbackContentFromJson(Map<String, dynamic> json) {
  return _FeedbackContent.fromJson(json);
}

/// @nodoc
class _$FeedbackContentTearOff {
  const _$FeedbackContentTearOff();

  _FeedbackContent call(
      {required int id,
      required int feedbackId,
      required String content,
      required int order}) {
    return _FeedbackContent(
      id: id,
      feedbackId: feedbackId,
      content: content,
      order: order,
    );
  }

  FeedbackContent fromJson(Map<String, Object> json) {
    return FeedbackContent.fromJson(json);
  }
}

/// @nodoc
const $FeedbackContent = _$FeedbackContentTearOff();

/// @nodoc
mixin _$FeedbackContent {
  int get id => throw _privateConstructorUsedError;
  int get feedbackId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackContentCopyWith<FeedbackContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackContentCopyWith<$Res> {
  factory $FeedbackContentCopyWith(
          FeedbackContent value, $Res Function(FeedbackContent) then) =
      _$FeedbackContentCopyWithImpl<$Res>;
  $Res call({int id, int feedbackId, String content, int order});
}

/// @nodoc
class _$FeedbackContentCopyWithImpl<$Res>
    implements $FeedbackContentCopyWith<$Res> {
  _$FeedbackContentCopyWithImpl(this._value, this._then);

  final FeedbackContent _value;
  // ignore: unused_field
  final $Res Function(FeedbackContent) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? feedbackId = freezed,
    Object? content = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      feedbackId: feedbackId == freezed
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$FeedbackContentCopyWith<$Res>
    implements $FeedbackContentCopyWith<$Res> {
  factory _$FeedbackContentCopyWith(
          _FeedbackContent value, $Res Function(_FeedbackContent) then) =
      __$FeedbackContentCopyWithImpl<$Res>;
  @override
  $Res call({int id, int feedbackId, String content, int order});
}

/// @nodoc
class __$FeedbackContentCopyWithImpl<$Res>
    extends _$FeedbackContentCopyWithImpl<$Res>
    implements _$FeedbackContentCopyWith<$Res> {
  __$FeedbackContentCopyWithImpl(
      _FeedbackContent _value, $Res Function(_FeedbackContent) _then)
      : super(_value, (v) => _then(v as _FeedbackContent));

  @override
  _FeedbackContent get _value => super._value as _FeedbackContent;

  @override
  $Res call({
    Object? id = freezed,
    Object? feedbackId = freezed,
    Object? content = freezed,
    Object? order = freezed,
  }) {
    return _then(_FeedbackContent(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      feedbackId: feedbackId == freezed
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_FeedbackContent implements _FeedbackContent {
  _$_FeedbackContent(
      {required this.id,
      required this.feedbackId,
      required this.content,
      required this.order});

  factory _$_FeedbackContent.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedbackContentFromJson(json);

  @override
  final int id;
  @override
  final int feedbackId;
  @override
  final String content;
  @override
  final int order;

  @override
  String toString() {
    return 'FeedbackContent(id: $id, feedbackId: $feedbackId, content: $content, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FeedbackContent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.feedbackId, feedbackId) ||
                const DeepCollectionEquality()
                    .equals(other.feedbackId, feedbackId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(feedbackId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(order);

  @JsonKey(ignore: true)
  @override
  _$FeedbackContentCopyWith<_FeedbackContent> get copyWith =>
      __$FeedbackContentCopyWithImpl<_FeedbackContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedbackContentToJson(this);
  }
}

abstract class _FeedbackContent implements FeedbackContent {
  factory _FeedbackContent(
      {required int id,
      required int feedbackId,
      required String content,
      required int order}) = _$_FeedbackContent;

  factory _FeedbackContent.fromJson(Map<String, dynamic> json) =
      _$_FeedbackContent.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get feedbackId => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  int get order => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeedbackContentCopyWith<_FeedbackContent> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedbackFile _$FeedbackFileFromJson(Map<String, dynamic> json) {
  return _FeedbackFile.fromJson(json);
}

/// @nodoc
class _$FeedbackFileTearOff {
  const _$FeedbackFileTearOff();

  _FeedbackFile call(
      {required int id,
      required int feedbackId,
      required String type,
      required int order,
      required String url,
      required double size,
      double? length}) {
    return _FeedbackFile(
      id: id,
      feedbackId: feedbackId,
      type: type,
      order: order,
      url: url,
      size: size,
      length: length,
    );
  }

  FeedbackFile fromJson(Map<String, Object> json) {
    return FeedbackFile.fromJson(json);
  }
}

/// @nodoc
const $FeedbackFile = _$FeedbackFileTearOff();

/// @nodoc
mixin _$FeedbackFile {
  int get id => throw _privateConstructorUsedError;
  int get feedbackId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError; //video, image, sound
  int get order => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  double? get length => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackFileCopyWith<FeedbackFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackFileCopyWith<$Res> {
  factory $FeedbackFileCopyWith(
          FeedbackFile value, $Res Function(FeedbackFile) then) =
      _$FeedbackFileCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int feedbackId,
      String type,
      int order,
      String url,
      double size,
      double? length});
}

/// @nodoc
class _$FeedbackFileCopyWithImpl<$Res> implements $FeedbackFileCopyWith<$Res> {
  _$FeedbackFileCopyWithImpl(this._value, this._then);

  final FeedbackFile _value;
  // ignore: unused_field
  final $Res Function(FeedbackFile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? feedbackId = freezed,
    Object? type = freezed,
    Object? order = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? length = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      feedbackId: feedbackId == freezed
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$FeedbackFileCopyWith<$Res>
    implements $FeedbackFileCopyWith<$Res> {
  factory _$FeedbackFileCopyWith(
          _FeedbackFile value, $Res Function(_FeedbackFile) then) =
      __$FeedbackFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int feedbackId,
      String type,
      int order,
      String url,
      double size,
      double? length});
}

/// @nodoc
class __$FeedbackFileCopyWithImpl<$Res> extends _$FeedbackFileCopyWithImpl<$Res>
    implements _$FeedbackFileCopyWith<$Res> {
  __$FeedbackFileCopyWithImpl(
      _FeedbackFile _value, $Res Function(_FeedbackFile) _then)
      : super(_value, (v) => _then(v as _FeedbackFile));

  @override
  _FeedbackFile get _value => super._value as _FeedbackFile;

  @override
  $Res call({
    Object? id = freezed,
    Object? feedbackId = freezed,
    Object? type = freezed,
    Object? order = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? length = freezed,
  }) {
    return _then(_FeedbackFile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      feedbackId: feedbackId == freezed
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_FeedbackFile implements _FeedbackFile {
  _$_FeedbackFile(
      {required this.id,
      required this.feedbackId,
      required this.type,
      required this.order,
      required this.url,
      required this.size,
      this.length});

  factory _$_FeedbackFile.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedbackFileFromJson(json);

  @override
  final int id;
  @override
  final int feedbackId;
  @override
  final String type;
  @override //video, image, sound
  final int order;
  @override
  final String url;
  @override
  final double size;
  @override
  final double? length;

  @override
  String toString() {
    return 'FeedbackFile(id: $id, feedbackId: $feedbackId, type: $type, order: $order, url: $url, size: $size, length: $length)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FeedbackFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.feedbackId, feedbackId) ||
                const DeepCollectionEquality()
                    .equals(other.feedbackId, feedbackId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(feedbackId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(length);

  @JsonKey(ignore: true)
  @override
  _$FeedbackFileCopyWith<_FeedbackFile> get copyWith =>
      __$FeedbackFileCopyWithImpl<_FeedbackFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedbackFileToJson(this);
  }
}

abstract class _FeedbackFile implements FeedbackFile {
  factory _FeedbackFile(
      {required int id,
      required int feedbackId,
      required String type,
      required int order,
      required String url,
      required double size,
      double? length}) = _$_FeedbackFile;

  factory _FeedbackFile.fromJson(Map<String, dynamic> json) =
      _$_FeedbackFile.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get feedbackId => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override //video, image, sound
  int get order => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  double get size => throw _privateConstructorUsedError;
  @override
  double? get length => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeedbackFileCopyWith<_FeedbackFile> get copyWith =>
      throw _privateConstructorUsedError;
}
