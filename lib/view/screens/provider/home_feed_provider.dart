import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweaterz_flutter/networking_service/feed_service.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/photo_view_gallery_screen.dart';
import 'package:sweaterz_flutter/view/screens/post_detail_screen.dart';
import 'package:sweaterz_flutter/view/screens/widget/post_profile_list_tile.dart';

class HomeFeedProvider extends ChangeNotifier {
  FeedService _feedService = FeedService();
  List<Widget> postWidgetList = [];
  bool isLoading = false;

  void initializePostWidgetList() {
    postWidgetList = [];
    _feedService.lastDocument = null;
    _feedService.hasMore = true;
    notifyListeners();
    print('yes');
  }

  void fetchNewPostWidget(BuildContext context) async {
    if (isLoading) {
      return;
    }
    if (_feedService.hasMore) {
      isLoading = true;
      List<DocumentSnapshot> _posts = await _feedService.fetchFollowingFeed();
      for (DocumentSnapshot post in _posts) {
        Map postData = post.data();
        Widget postWidget = _postWidget(postData: postData, context: context);
        postWidgetList.add(postWidget);
      }

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
            Padding(
              padding: EdgeInsets.all(3),
              child: GestureDetector(
                onTap: () {
                  //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
                },
                child: Text(
                  postData['post_sports_tag'],
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
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                postProfileListTile(
                    email: postData['creator_email'],
                    profileName: postData['creator_profile_name'],
                    profilePhotoURL: postData['creator_profile_photo_url'],
                    createdTime: postData['created_time'],
                    viewCount: postData['view_count']),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      postData['content'],
                      style: kPostBodyTextStyle,
                    )),
                Builder(builder: (context) {
                  if (postData['upload_type'] == 'video') {
                    return Stack(alignment: Alignment.center, children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: CachedNetworkImage(
                          imageUrl: postData['thumbnail_download_url'],
                          placeholder: (context, url) => Icon(Icons.photo),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Icon(Icons.play_arrow),
                    ]);
                  } else if (postData['upload_type'] == 'images') {
                    int fileLength = postData['file_list'].length;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhotoViewGalleryScreen(
                                      fileList: postData['file_list'],
                                    )));
                      },
                      child: Container(
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
                                  width: 100.0,
                                  height: 100.0,
                                  child: CachedNetworkImage(
                                    imageUrl: postData['file_list'][index]
                                        ['download_url'],
                                    placeholder: (context, url) =>
                                        Icon(Icons.photo),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (index == 2 && fileLength > 3)
                                  Text(
                                    '+' + (fileLength - 3).toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
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
