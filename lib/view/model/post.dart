import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class Post {
  String _postId;
  String _memberEmail;
  String _profileName;
  String _profilePhotoURL;
  String _uploadType;
  List<File> _imageFileList;
  String _content;
  int _likeCount = 0;
  int _viewCount = 0;
  String _sports;
  List<String> _tagsList;
  FeedbackPrivacy _feedbackPrivacy;
  PostPrivacy _postPrivacy;
  List<String> _feedbackIdList;
  List<Map> _videoFileList;

  List<Map> get videoFileList => _videoFileList;
  String get postId => _postId;
  String get memberEmail => _memberEmail;
  String get uploadType => _uploadType;
  List<File> get imageFileList => _imageFileList;
  String get content => _content;
  int get likeCount => _likeCount;
  int get viewCount => _viewCount;
  String get sports => _sports;
  List<String> get tagsList => _tagsList;
  FeedbackPrivacy get feedbackPrivacy => _feedbackPrivacy;
  PostPrivacy get postPrivacy => _postPrivacy;
  List<String> get feedbackIdList => _feedbackIdList;
  String get profileName => _profileName;
  String get profilePhotoUrl => _profilePhotoURL;

  void setForUpload({
    TextEditingController contentsController,
    String addedSports,
    List<String> addedTagsList,
    String uploadType,
    List<File> fileList,
    String profileName,
    String profilePhotoUrl,
    String memberEmail,
    List<Map> videoFileList,
  }) {
    if (uploadType == 'video') {
      setVideoFileList(videoFileList);
    } else if (uploadType == 'images') {
      setImageFileList(fileList);
    } else {}
    setContent(contentsController.text);
    setSports(addedSports);
    setTagsList(addedTagsList);
    setUploadType(uploadType);
    setProfilePhotoUrl(profilePhotoUrl);
    setProfileName(profileName);
    setMemberEmail(memberEmail);
  }

  void setForFetchFeed() {}

  void setLikeCount(int likeCount) {
    _likeCount = likeCount;
  }

  void setViewCount(int viewCount) {
    _viewCount = viewCount;
  }

  void setVideoFileList(List<Map> videoFileList) {
    _videoFileList = videoFileList;
  }

  void setMemberEmail(String memberEmail) {
    _memberEmail = memberEmail;
  }

  void setProfileName(String profileName) {
    _profileName = profileName;
  }

  void setProfilePhotoUrl(String profilePhotoUrl) {
    _profilePhotoURL = profilePhotoUrl;
  }

  void setUploadType(String uploadType) {
    _uploadType = uploadType;
  }

  void setPostId(String postId) {
    _postId = postId;
  }

  void setImageFileList(List<File> imageFileList) {
    _imageFileList = imageFileList;
  }

  void setContent(String content) {
    _content = content;
  }

  void setSports(String sports) {
    _sports = sports;
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
