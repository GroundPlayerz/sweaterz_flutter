import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed
class Feedback with _$Feedback {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Feedback({
    required int id,
    required int userId,
    required int postId,
    required String createdTime,
    required bool isLikeButtonPressed,
    List<FeedbackContent>? feedbackContentList,
    List<FeedbackFile>? feedbackFileList,
    String? updatedTime, //[nullable]
    double? startTime, //[nullable]
    double? endTime,
  }) = _Feedback;

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
}

@freezed
class FeedbackContent with _$FeedbackContent {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory FeedbackContent({
    required int id,
    required int feedbackId,
    required String content,
    required int order,
  }) = _FeedbackContent;
  factory FeedbackContent.fromJson(Map<String, dynamic> json) =>
      _$FeedbackContentFromJson(json);
}

@freezed
class FeedbackFile with _$FeedbackFile {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory FeedbackFile({
    required int id,
    required int feedbackId,
    required String type, //video, image, sound
    required int order,
    required String url,
    required double size,
    double? length,
  }) = _FeedbackFile;

  factory FeedbackFile.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFileFromJson(json);
}
