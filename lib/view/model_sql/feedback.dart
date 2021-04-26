import 'package:json_annotation/json_annotation.dart';
part 'feedback.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Feedback {
  final int? id;
  final int? userId;
  final int? postId;
  final String? createdTime;
  final String? updatedTime; //[nullable]
  final double? startTime; //[nullable]
  final double? endTime; //[nullable]

  Feedback(this.id, this.userId, this.postId, this.createdTime,
      this.updatedTime, this.startTime, this.endTime);

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
