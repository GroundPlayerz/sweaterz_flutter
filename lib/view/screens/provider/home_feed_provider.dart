import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_service/feed_service.dart';
import 'package:sweaterz_flutter/networking_service/post_detail_service.dart';
import 'package:sweaterz_flutter/view/screens/widget/feed_post_widget.dart';

class HomeFeedProvider extends ChangeNotifier {
  FeedService _feedService = FeedService();
  List<Widget> postWidgetList = [];
  List<Map> postDataList = [];
  bool isLoading = false;

  void initializePostWidgetList() {
    postWidgetList = [];
    postDataList = [];
    _feedService.lastDocument = null;
    _feedService.hasMore = true;
    notifyListeners();
  }

  void fetchNewPostWidget(BuildContext context) async {
    if (isLoading) {
      return;
    }
    if (_feedService.hasMore) {
      isLoading = true;
      List<DocumentSnapshot> _posts = await _feedService.fetchHomeFeed();
      for (int i = 0; i < _posts.length; i++) {
        Map postData = _posts[i].data()!;
        postDataList.add(postData);
        Widget postWidget = feedPostWidget(
            postDataIndex: i,
            postData: postData,
            context: context,
            feedType: 'home');
        postWidgetList.add(postWidget);
      }

      isLoading = false;
      notifyListeners();
    }
  }

  toggleLikeButton(int postDataIndex) async {
    postDataList[postDataIndex]['is_like_button_pressed'] =
        !postDataList[postDataIndex]['is_like_button_pressed'];
    print(postDataList[postDataIndex]['is_like_button_pressed']);
    notifyListeners();
  }

  setLikeButtonState(int postDataIndex) async {
    bool isLikeButtonPressed = await PostDetailService()
        .checkPostLikeButtonPressed(postDataList[postDataIndex]);
    postDataList[postDataIndex]['is_like_button_pressed'] = isLikeButtonPressed;
    notifyListeners();
  }

  increaseLikeCountCache(int postDataIndex) {
    postDataList[postDataIndex]['like_count']++;
    notifyListeners();
  }

  decreaseLikeCountCache(int postDataIndex) {
    postDataList[postDataIndex]['like_count']--;
    notifyListeners();
  }

  // setCallbackFunctionOfPostWidget({
  //   Widget postWidget,
  //   Function sportsTagOnTapCallback,
  //   Function tagOnTapCallback,
  //   Function postOnTapCallback,
  //   Function profileOnTapCallback,
  // }) {}

}
