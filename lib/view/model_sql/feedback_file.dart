import 'package:json_annotation/json_annotation.dart';
part 'feedback_file.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FeedbackFile {
  final int? id;
  final int? feedbackId;
  final String? type; //video, image, sound
  final int? order;
  final String? url;
  final double? size;
  final double? length; //[nullable: video, sound의 경우에만 생성]

  FeedbackFile(this.id, this.feedbackId, this.type, this.order, this.url,
      this.size, this.length);

  factory FeedbackFile.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFileFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackFileToJson(this);
}
