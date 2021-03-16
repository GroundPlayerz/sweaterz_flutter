import 'package:sweaterz_flutter/view/model/enums.dart';

class Post {
  String _postId;
  String _memberEmail;
  String _filepath;
  String _title;
  String _content;
  int _likeCount = 0;
  List<String> _sportsList;
  List<String> _tagsList;
  FeedbackPrivacy _feedbackPrivacy;
  PostPrivacy _postPrivacy;
  List<String> _feedbackIdList;

  String getFilePath() {
    return _filepath;
  }

  void setPostId(String postId) {
    _postId = postId;
  }

  void setFilePath(String filePath) {
    _filepath = filePath;
  }

  void setTitle(String title) {
    _title = title;
  }

  void setContent(String content) {
    _content = content;
  }

  void setSportsList(List<String> sportsList) {
    _sportsList = sportsList;
  }

  void setTagsList(List<String> tagsList) {
    _tagsList = tagsList;
  }

  void setFeedbackPrivacy(FeedbackPrivacy feedbackPrivacy) {
    _feedbackPrivacy = feedbackPrivacy;
  }

  void setPostPrivacy(PostPrivacy postPrivacy) {
    _postPrivacy = postPrivacy;
  }
}
