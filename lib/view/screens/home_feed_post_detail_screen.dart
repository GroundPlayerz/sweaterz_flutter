import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sweaterz_flutter/networking_service/post_detail_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';

import 'package:sweaterz_flutter/view/screens/photo_view_gallery_screen.dart';
import 'package:sweaterz_flutter/view/screens/provider/home_feed_provider.dart';

import 'package:sweaterz_flutter/view/screens/video_player.dart';
import 'package:sweaterz_flutter/view/screens/widget/post_profile_list_tile.dart';

class HomeFeedPostDetailScreen extends StatefulWidget {
  final int postDataIndex;
  final String feedType;

  HomeFeedPostDetailScreen({this.postDataIndex, this.feedType});

  @override
  _HomeFeedPostDetailScreenState createState() =>
      _HomeFeedPostDetailScreenState();
}

class _HomeFeedPostDetailScreenState extends State<HomeFeedPostDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostDetailService().increaseViewCount(
        Provider.of<HomeFeedProvider>(context, listen: false)
            .postDataList[widget.postDataIndex]);
  }

  @override
  Widget build(BuildContext context) {
    final _postDataProvider =
        Provider.of<HomeFeedProvider>(context, listen: true);
    final _postData = _postDataProvider.postDataList[widget.postDataIndex];

    return Scaffold(
        backgroundColor: kBackgroundWhiteColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kBackgroundWhiteColor,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(
                    _postData['post_sports_tag'],
                    style: kSportsTagTextStyle.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  dragStartBehavior: DragStartBehavior.start,
                  child: Row(
                    children: [
                      for (Map tag in _postData['post_tag_list'])
                        GestureDetector(
                          onTap: () {
                            //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 0.0),
                            child: Text(
                              '#${tag['name_lower']}',
                              style:
                                  kTagTextStyle.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: kIconGreyColor1_B2B2B2, //change your color here
          ),
        ),
        body: ListView(
          children: [
            postProfileListTile(
                email: _postData['creator_email'],
                profileName: _postData['creator_profile_name'],
                profilePhotoURL: _postData['creator_profile_photo_url'],
                createdTime: _postData['created_time'],
                viewCount: _postData['view_count']),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(22.0),
              child: Text(
                _postData['content'],
                style: kPostBodyTextStyle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Builder(builder: (context) {
              if (_postData['upload_type'] == 'video') {
                return Container(
                  height: 200,
                  width: double.infinity,
                  child: VideoPlayer(
                    videoDownloadURL: _postData['file_list'][0]['download_url'],
                    thumbnailDownloadURL: _postData['thumbnail_download_url'],
                  ),
                );
              } else if (_postData['upload_type'] == 'images') {
                return CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 300.0,
                      enableInfiniteScroll: false,
                    ),
                    itemCount: _postData['file_list'].length,
                    itemBuilder: (context, index, _) {
                      Map fileData = _postData['file_list'][index];
                      return Builder(
                        builder: (context) {
                          return Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.white),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PhotoViewGalleryScreen(
                                                fileList:
                                                    _postData['file_list'],
                                                firstPage: index,
                                              )));
                                },
                                child: CachedNetworkImage(
                                  imageUrl: fileData['download_url'],
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ));
                        },
                      );
                    });
              } else {
                return Container();
              }
            }),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.all(22.0),
              child: Row(
                children: [
                  IconButton(
                    icon: true //_postData['is_like_button_pressed']
                        ? Icon(
                            CupertinoIcons.suit_heart_fill,
                            color: kSweaterzColor,
                          )
                        : Icon(
                            CupertinoIcons.suit_heart,
                            color: kSweaterzColor,
                          ),
                    onPressed: () {
                      // Todo 나중에 구현하기
                      // _postDataProvider.toggleLikeButton(widget.postDataIndex);
                      // if (_postData['is_like_button_pressed']) {
                      //   _postDataProvider
                      //       .increaseLikeCountCache(widget.postDataIndex);
                      //   PostDetailService().pressPostLikeButton(_postData);
                      // } else {
                      //   _postDataProvider
                      //       .decreaseLikeCountCache(widget.postDataIndex);
                      //   PostDetailService().cancelPostLikeButton(_postData);
                      // }
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(_postData['like_count'].toString()),
                ],
              ),
            )
          ],
        ));
  }
}
