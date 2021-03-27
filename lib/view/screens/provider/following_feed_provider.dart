import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweaterz_flutter/networking_service/feed_service.dart';
import 'package:sweaterz_flutter/view/screens/post_detail_screen.dart';
import 'package:sweaterz_flutter/view/screens/widget/post_profile_list_tile.dart';

class FollowingFeedProvider extends ChangeNotifier {
  FeedService _feedService = FeedService();
  List<Widget> postWidgetList = [];
  bool isLoading = false;

  void fetchNewPostWidget(BuildContext context) async {
    if (isLoading) {
      return;
    }
    if (_feedService.hasMore) {
      isLoading = true;
      notifyListeners();

      List<DocumentSnapshot> _posts = await _feedService.fetchFollowingFeed();
      List<Widget> tempWidgetList = [];
      for (DocumentSnapshot post in _posts) {
        Map postData = post.data();
        Widget postWidget = _postWidget(postData: postData, context: context);
        tempWidgetList.add(postWidget);
      }

      postWidgetList.addAll(tempWidgetList);
      isLoading = false;
      notifyListeners();
    }
  }

  // setCallbackFunctionOfPostWidget({
  //   Widget postWidget,
  //   Function sportsTagOnTapCallback,
  //   Function tagOnTapCallback,
  //   Function postOnTapCallback,
  //   Function profileOnTapCallback,
  // }) {}

  Widget _postWidget({
    Map postData,
    BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(children: [
        Row(
          children: [
            for (Map sport in postData['post_sports_tag_list'])
              Padding(
                padding: EdgeInsets.all(3),
                child: GestureDetector(
                  onTap: () {
                    //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
                  },
                  child: Text(
                    sport['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            for (Map tag in postData['post_tag_list'])
              Padding(
                padding: EdgeInsets.all(3),
                child: GestureDetector(
                  onTap: () {
                    //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
                  },
                  child: Text(
                    '#${tag['name_lower']}',
                  ),
                ),
              ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // ToDo 게시물 상세화면으로 넘어가기
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetailScreen(
                          postData: postData,
                        )));
          },
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                postProfileListTile(
                    email: postData['creator_email'],
                    profileName: postData['creator_profile_name'],
                    profilePhotoURL: postData['creator_profile_photo_url'],
                    createdTime: postData['created_time']),
                SizedBox(
                  height: 10,
                ),
                Text(postData['content']),
                Builder(builder: (context) {
                  if (postData['upload_type'] == 'video') {
                    return Stack(alignment: Alignment.center, children: [
                      CachedNetworkImage(
                        imageUrl: postData['thumbnail_download_url'],
                        placeholder: (context, url) => Icon(Icons.photo),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: 100,
                        height: 50,
                      ),
                      Icon(Icons.play_arrow)
                    ]);
                  } else if (postData['upload_type'] == 'images') {
                    return Row(
                      children: [
                        for (Map image in postData['file_list'])
                          CachedNetworkImage(
                            imageUrl: image['download_url'],
                            placeholder: (context, url) => Icon(Icons.photo),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            width: 50,
                            height: 30,
                          ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
