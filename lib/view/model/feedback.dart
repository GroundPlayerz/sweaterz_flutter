import 'package:sweaterz_flutter/view/model/enums.dart';

class FeedbacksContainerByTime {
  String _postId;
  FeedbackTimeType _feedbackTimeType;
  String _startTime;
  String _endTime;
}

class Feedback {
  String _writerEmail;
  String _writerProfilePhotoUrl;
  MemberRole _writerRole;
  String _createdTime;
  FeedbackType _feedbackType;
  int _likeCount = 0;
  bool _isEdited = false;
  Map _textContentMap; // {'1': '오늘 참 잘했어요~~', '2': '사실은 개 못했어요 ㅋㅋ'}
  Map _imageUrlMap; // {'3': 'www.googlestorage....'}
  Map _videoUrlMap; // { '5': {'thumbnail_url': 'www....', 'video_url': 'www...'},  }
  Map _soundUrlMap; // {'4': {'sound_url': 'www...', 'length': '34'} }
}
