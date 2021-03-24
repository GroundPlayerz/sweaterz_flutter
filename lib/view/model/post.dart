import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class Post {
  String _postId;
  String _memberEmail;
  String _profileName;
  String _profile_photo_url;
  String _uploadType;
  List<File> _files;
  String _content;
  int _likeCount = 0;
  int _viewCount = 0;
  List<String> _sportsList;
  List<String> _tagsList;
  FeedbackPrivacy _feedbackPrivacy;
  PostPrivacy _postPrivacy;
  List<String> _feedbackIdList;

  String get postId => _postId;
  String get memberEmail => _memberEmail;
  String get uploadType => _uploadType;
  List<File> get files => _files;
  String get content => _content;
  int get likeCount => _likeCount;
  int get viewCount => _viewCount;
  List<String> get sportsList => _sportsList;
  List<String> get tagsList => _tagsList;
  FeedbackPrivacy get feedbackPrivacy => _feedbackPrivacy;
  PostPrivacy get postPrivacy => _postPrivacy;
  List<String> get feedbackIdList => _feedbackIdList;
  String get profileName => _profileName;
  String get profilePhotoUrl => _profile_photo_url;

  void setForUpload(
      {TextEditingController contentsController,
      List<String> addedSportsList,
      List<String> addedTagsList,
      String uploadType,
      List<File> fileList,
      String profileName,
      String profilePhotoUrl,
      String memberEmail}) {
    setContent(contentsController.text);
    setSportsList(addedSportsList);
    setTagsList(addedTagsList);
    setUploadType(uploadType);
    setFilesList(fileList);
    setProfilePhotoUrl(profilePhotoUrl);
    setProfileName(profileName);
    setMemberEmail(memberEmail);
  }

  void setMemberEmail(String memberEmail) {
    _memberEmail = memberEmail;
  }

  void setProfileName(String profileName) {
    _profileName = profileName;
  }

  void setProfilePhotoUrl(String profilePhotoUrl) {
    _profile_photo_url = profilePhotoUrl;
  }

  void setUploadType(String uploadType) {
    _uploadType = uploadType;
  }

  void setPostId(String postId) {
    _postId = postId;
  }

  void setFilesList(List<File> filesList) {
    _files = filesList;
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
