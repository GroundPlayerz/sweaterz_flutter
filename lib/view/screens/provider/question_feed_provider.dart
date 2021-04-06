import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_service/feed_service.dart';
import 'package:sweaterz_flutter/networking_service/post_detail_service.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/question_feed_post_detail_screen.dart';
import 'package:sweaterz_flutter/view/screens/widget/post_profile_list_tile.dart';

class QuestionFeedProvider extends ChangeNotifier {
  FeedService _feedService = FeedService();
  List<Widget> postWidgetList = [];
  bool isLoading = false;
  List<Map> postDataList = [];
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
      List<DocumentSnapshot> _posts = await _feedService.fetchQuestionFeed();
      for (int i = 0; i < _posts.length; i++) {
        Map postData = _posts[i].data()!;
        postDataList.add(postData);
        Widget postWidget = _postWidget(postDataIndex: i, context: context);
        postWidgetList.add(postWidget);
      }

      isLoading = false;
      notifyListeners();
    }
  }

  toggleLikeButton(int postDataIndex) async {
    postDataList[postDataIndex]['is_like_button_pressed'] =
        !postDataList[postDataIndex]['is_like_button_pressed'];
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

  Widget _postWidget({
    required int postDataIndex,
    required BuildContext context,
  }) {
    Map postData = postDataList[postDataIndex];
    return Padding(
      padding: EdgeInsets.fromLTRB(11.0, 5.0, 11.0, 27.0),
      child: Column(children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                child: Text(
                  postData['post_sports_tag'],
                  style: kSportsTagTextStyle,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                dragStartBehavior: DragStartBehavior.start,
                child: Row(
                  children: [
                    for (Map tag in postData['post_tag_list'])
                      GestureDetector(
                        onTap: () {
                          //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 5.0),
                          child: Text(
                            '#${tag['name_lower']}',
                            style: kTagTextStyle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () async {
            // ToDo 게시물 상세화면으로 넘어가기
            // await setLikeButtonState(postDataIndex);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuestionFeedPostDetailScreen(
                          postDataIndex: postDataIndex,
                          feedType: 'question',
                        )));
          },
          child: Container(
            //프로필
            // Card를 바꿈. BoxDecoration으로 쓸 수 있더라고.
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.0),
                postProfileListTile(
                    email: postData['creator_email'],
                    profileName: postData['creator_profile_name'],
                    profilePhotoURL: postData['creator_profile_photo_url'],
                    createdTime: postData['created_time'],
                    viewCount: postData['view_count']),
                Padding(
                  padding: EdgeInsets.fromLTRB(21, 5, 21, 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            postData['is_question'] != null &&
                                    postData['is_question'] == true
                                ? Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: SizedBox(
                                      width: 16,
                                      child: Image(
                                        image: AssetImage(
                                            'images/question_mark_big@3x.png'),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  )
                                : Container(),
                            Expanded(
                              child: Text(
                                postData['content'],
                                style: kPostBodyTextStyle,
                                maxLines: 5,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ]),
                      SizedBox(height: 10.0),
                      Builder(
                        builder: (context) {
                          if (postData['upload_type'] == 'video') {
                            return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 90.0,
                                    width: 160.0,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          postData['thumbnail_download_url'],
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 90.0,
                                    width: 160.0,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ]);
                          } else if (postData['upload_type'] == 'images') {
                            int fileLength = postData['file_list'].length;
                            return Container(
                              height: 150,
                              width: double.infinity,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: fileLength > 3 ? 3 : fileLength,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 4.0),
                                itemBuilder: (BuildContext context, int index) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 90.0,
                                        height: 67.5,
                                        child: CachedNetworkImage(
                                          imageUrl: postData['file_list'][index]
                                              ['download_url'],
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        height: 67.5,
                                        width: 90.0,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                      if (index == 2 && fileLength > 3)
                                        Text(
                                          '+' + (fileLength - 3).toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
