import 'package:sweaterz_flutter/view/model/enums.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class Post {
  String _postId;
  String _memberEmail;
  String _uploadType;
  List<AssetEntity> _assets;
  String _title;
  String _content;
  int _likeCount = 0;
  List<String> _sportsList;
  List<String> _tagsList;
  FeedbackPrivacy _feedbackPrivacy;
  PostPrivacy _postPrivacy;
  List<String> _feedbackIdList;

  List<AssetEntity> getFilePath() {
    return _assets;
  }

  void setPostId(String postId) {
    _postId = postId;
  }

  void setFilePath(List<AssetEntity> assets) {
    _assets = assets;
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
