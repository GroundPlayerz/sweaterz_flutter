// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {required int id,
      required int userId,
      required int sportsId,
      required String content,
      required String isQuestion,
      required String uploadType,
      required String postPrivacy,
      required String createdTime,
      List<PostFile>? postFileList,
      required bool isLikeButtonPressed,
      String? updatedTime}) {
    return _Post(
      id: id,
      userId: userId,
      sportsId: sportsId,
      content: content,
      isQuestion: isQuestion,
      uploadType: uploadType,
      postPrivacy: postPrivacy,
      createdTime: createdTime,
      postFileList: postFileList,
      isLikeButtonPressed: isLikeButtonPressed,
      updatedTime: updatedTime,
    );
  }

  Post fromJson(Map<String, Object> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get sportsId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get isQuestion => throw _privateConstructorUsedError;
  String get uploadType =>
      throw _privateConstructorUsedError; //text, image, video
  String get postPrivacy =>
      throw _privateConstructorUsedError; //all, follower, none
  String get createdTime => throw _privateConstructorUsedError;
  List<PostFile>? get postFileList => throw _privateConstructorUsedError;
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  String? get updatedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int userId,
      int sportsId,
      String content,
      String isQuestion,
      String uploadType,
      String postPrivacy,
      String createdTime,
      List<PostFile>? postFileList,
      bool isLikeButtonPressed,
      String? updatedTime});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? sportsId = freezed,
    Object? content = freezed,
    Object? isQuestion = freezed,
    Object? uploadType = freezed,
    Object? postPrivacy = freezed,
    Object? createdTime = freezed,
    Object? postFileList = freezed,
    Object? isLikeButtonPressed = freezed,
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
      sportsId: sportsId == freezed
          ? _value.sportsId
          : sportsId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isQuestion: isQuestion == freezed
          ? _value.isQuestion
          : isQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      uploadType: uploadType == freezed
          ? _value.uploadType
          : uploadType // ignore: cast_nullable_to_non_nullable
              as String,
      postPrivacy: postPrivacy == freezed
          ? _value.postPrivacy
          : postPrivacy // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      postFileList: postFileList == freezed
          ? _value.postFileList
          : postFileList // ignore: cast_nullable_to_non_nullable
              as List<PostFile>?,
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int userId,
      int sportsId,
      String content,
      String isQuestion,
      String uploadType,
      String postPrivacy,
      String createdTime,
      List<PostFile>? postFileList,
      bool isLikeButtonPressed,
      String? updatedTime});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? sportsId = freezed,
    Object? content = freezed,
    Object? isQuestion = freezed,
    Object? uploadType = freezed,
    Object? postPrivacy = freezed,
    Object? createdTime = freezed,
    Object? postFileList = freezed,
    Object? isLikeButtonPressed = freezed,
    Object? updatedTime = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      sportsId: sportsId == freezed
          ? _value.sportsId
          : sportsId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isQuestion: isQuestion == freezed
          ? _value.isQuestion
          : isQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      uploadType: uploadType == freezed
          ? _value.uploadType
          : uploadType // ignore: cast_nullable_to_non_nullable
              as String,
      postPrivacy: postPrivacy == freezed
          ? _value.postPrivacy
          : postPrivacy // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      postFileList: postFileList == freezed
          ? _value.postFileList
          : postFileList // ignore: cast_nullable_to_non_nullable
              as List<PostFile>?,
      isLikeButtonPressed: isLikeButtonPressed == freezed
          ? _value.isLikeButtonPressed
          : isLikeButtonPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Post implements _Post {
  _$_Post(
      {required this.id,
      required this.userId,
      required this.sportsId,
      required this.content,
      required this.isQuestion,
      required this.uploadType,
      required this.postPrivacy,
      required this.createdTime,
      this.postFileList,
      required this.isLikeButtonPressed,
      this.updatedTime});

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int sportsId;
  @override
  final String content;
  @override
  final String isQuestion;
  @override
  final String uploadType;
  @override //text, image, video
  final String postPrivacy;
  @override //all, follower, none
  final String createdTime;
  @override
  final List<PostFile>? postFileList;
  @override
  final bool isLikeButtonPressed;
  @override
  final String? updatedTime;

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, sportsId: $sportsId, content: $content, isQuestion: $isQuestion, uploadType: $uploadType, postPrivacy: $postPrivacy, createdTime: $createdTime, postFileList: $postFileList, isLikeButtonPressed: $isLikeButtonPressed, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.sportsId, sportsId) ||
                const DeepCollectionEquality()
                    .equals(other.sportsId, sportsId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.isQuestion, isQuestion) ||
                const DeepCollectionEquality()
                    .equals(other.isQuestion, isQuestion)) &&
            (identical(other.uploadType, uploadType) ||
                const DeepCollectionEquality()
                    .equals(other.uploadType, uploadType)) &&
            (identical(other.postPrivacy, postPrivacy) ||
                const DeepCollectionEquality()
                    .equals(other.postPrivacy, postPrivacy)) &&
            (identical(other.createdTime, createdTime) ||
                const DeepCollectionEquality()
                    .equals(other.createdTime, createdTime)) &&
            (identical(other.postFileList, postFileList) ||
                const DeepCollectionEquality()
                    .equals(other.postFileList, postFileList)) &&
            (identical(other.isLikeButtonPressed, isLikeButtonPressed) ||
                const DeepCollectionEquality()
                    .equals(other.isLikeButtonPressed, isLikeButtonPressed)) &&
            (identical(other.updatedTime, updatedTime) ||
                const DeepCollectionEquality()
                    .equals(other.updatedTime, updatedTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(sportsId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(isQuestion) ^
      const DeepCollectionEquality().hash(uploadType) ^
      const DeepCollectionEquality().hash(postPrivacy) ^
      const DeepCollectionEquality().hash(createdTime) ^
      const DeepCollectionEquality().hash(postFileList) ^
      const DeepCollectionEquality().hash(isLikeButtonPressed) ^
      const DeepCollectionEquality().hash(updatedTime);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostToJson(this);
  }
}

abstract class _Post implements Post {
  factory _Post(
      {required int id,
      required int userId,
      required int sportsId,
      required String content,
      required String isQuestion,
      required String uploadType,
      required String postPrivacy,
      required String createdTime,
      List<PostFile>? postFileList,
      required bool isLikeButtonPressed,
      String? updatedTime}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  int get sportsId => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  String get isQuestion => throw _privateConstructorUsedError;
  @override
  String get uploadType => throw _privateConstructorUsedError;
  @override //text, image, video
  String get postPrivacy => throw _privateConstructorUsedError;
  @override //all, follower, none
  String get createdTime => throw _privateConstructorUsedError;
  @override
  List<PostFile>? get postFileList => throw _privateConstructorUsedError;
  @override
  bool get isLikeButtonPressed => throw _privateConstructorUsedError;
  @override
  String? get updatedTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}

PostFile _$PostFileFromJson(Map<String, dynamic> json) {
  return _PostFile.fromJson(json);
}

/// @nodoc
class _$PostFileTearOff {
  const _$PostFileTearOff();

  _PostFile call(
      {required int id,
      required int postId,
      required String type,
      required int order,
      required String url,
      required double size,
      double? length}) {
    return _PostFile(
      id: id,
      postId: postId,
      type: type,
      order: order,
      url: url,
      size: size,
      length: length,
    );
  }

  PostFile fromJson(Map<String, Object> json) {
    return PostFile.fromJson(json);
  }
}

/// @nodoc
const $PostFile = _$PostFileTearOff();

/// @nodoc
mixin _$PostFile {
  int get id => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError; //video, image, sound
  int get order => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  double? get length => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostFileCopyWith<PostFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFileCopyWith<$Res> {
  factory $PostFileCopyWith(PostFile value, $Res Function(PostFile) then) =
      _$PostFileCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int postId,
      String type,
      int order,
      String url,
      double size,
      double? length});
}

/// @nodoc
class _$PostFileCopyWithImpl<$Res> implements $PostFileCopyWith<$Res> {
  _$PostFileCopyWithImpl(this._value, this._then);

  final PostFile _value;
  // ignore: unused_field
  final $Res Function(PostFile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
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
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
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
abstract class _$PostFileCopyWith<$Res> implements $PostFileCopyWith<$Res> {
  factory _$PostFileCopyWith(_PostFile value, $Res Function(_PostFile) then) =
      __$PostFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int postId,
      String type,
      int order,
      String url,
      double size,
      double? length});
}

/// @nodoc
class __$PostFileCopyWithImpl<$Res> extends _$PostFileCopyWithImpl<$Res>
    implements _$PostFileCopyWith<$Res> {
  __$PostFileCopyWithImpl(_PostFile _value, $Res Function(_PostFile) _then)
      : super(_value, (v) => _then(v as _PostFile));

  @override
  _PostFile get _value => super._value as _PostFile;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? type = freezed,
    Object? order = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? length = freezed,
  }) {
    return _then(_PostFile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
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
class _$_PostFile implements _PostFile {
  _$_PostFile(
      {required this.id,
      required this.postId,
      required this.type,
      required this.order,
      required this.url,
      required this.size,
      this.length});

  factory _$_PostFile.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFileFromJson(json);

  @override
  final int id;
  @override
  final int postId;
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
    return 'PostFile(id: $id, postId: $postId, type: $type, order: $order, url: $url, size: $size, length: $length)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
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
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(length);

  @JsonKey(ignore: true)
  @override
  _$PostFileCopyWith<_PostFile> get copyWith =>
      __$PostFileCopyWithImpl<_PostFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostFileToJson(this);
  }
}

abstract class _PostFile implements PostFile {
  factory _PostFile(
      {required int id,
      required int postId,
      required String type,
      required int order,
      required String url,
      required double size,
      double? length}) = _$_PostFile;

  factory _PostFile.fromJson(Map<String, dynamic> json) = _$_PostFile.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get postId => throw _privateConstructorUsedError;
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
  _$PostFileCopyWith<_PostFile> get copyWith =>
      throw _privateConstructorUsedError;
}
