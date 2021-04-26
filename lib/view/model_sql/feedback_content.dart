import 'package:json_annotation/json_annotation.dart';
part 'feedback_content.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FeedbackContent {
  final int? id;
  final int? feedbackId;
  final String? content;
  final int? order;

  FeedbackContent(this.id, this.feedbackId, this.content, this.order);

  factory FeedbackContent.fromJson(Map<String, dynamic> json) =>
      _$FeedbackContentFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackContentToJson(this);
}
