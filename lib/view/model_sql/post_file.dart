import 'package:json_annotation/json_annotation.dart';
part 'post_file.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PostFile {
  final int? id;
  final int? postId;
  final String? type; //video, image, sound
  final int? order;
  final String? url;
  final double? size;
  final double? length;

  PostFile(this.id, this.postId, this.type, this.order, this.url, this.size,
      this.length); //[nullable : video, sound의 경우에만 생성]

  factory PostFile.fromJson(Map<String, dynamic> json) =>
      _$PostFileFromJson(json);
  Map<String, dynamic> toJson() => _$PostFileToJson(this);
}
