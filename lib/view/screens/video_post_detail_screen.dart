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
import 'package:sweaterz_flutter/view/screens/provider/question_feed_provider.dart';

import 'package:sweaterz_flutter/view/screens/video_player.dart';
import 'package:sweaterz_flutter/view/screens/widget/carousel_image_viewer.dart';
import 'package:sweaterz_flutter/view/screens/widget/post_profile_list_tile.dart';

class VideoPostDetailScreen extends StatefulWidget {
  final int postDataIndex;
  final String feedType;

  VideoPostDetailScreen({required this.postDataIndex, required this.feedType});

  @override
  _VideoPostDetailScreenState createState() => _VideoPostDetailScreenState();
}

class _VideoPostDetailScreenState extends State<VideoPostDetailScreen> {
  TextEditingController feedbackController = TextEditingController();
  FocusNode? myFocusNode;
  bool isTextFieldTapped = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
    if (widget.feedType == 'home') {
      PostDetailService().increaseViewCount(
          Provider.of<HomeFeedProvider>(context, listen: false)
              .postDataList[widget.postDataIndex]);
    } else {
      PostDetailService().increaseViewCount(
          Provider.of<QuestionFeedProvider>(context, listen: false)
              .postDataList[widget.postDataIndex]);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myFocusNode?.unfocus();
    myFocusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _postDataProvider = widget.feedType == 'home'
        ? Provider.of<HomeFeedProvider>(context, listen: true)
        : Provider.of<QuestionFeedProvider>(context, listen: true);

    final _postData = widget.feedType == 'home'
        ? Provider.of<HomeFeedProvider>(context, listen: true)
            .postDataList[widget.postDataIndex]
        : Provider.of<QuestionFeedProvider>(context, listen: true)
            .postDataList[widget.postDataIndex];

    void onTapOutsideOfTextField() {
      myFocusNode?.unfocus();
      setState(() {
        isTextFieldTapped = false;
      });
    }

    Widget _feedbackWidget(
        {required String profileName,
        required String profilePhotoURL,
        required String feedbackContent}) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 9,
        ),
        child: Container(
          color: kBackgroundGreyColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.08),
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: CachedNetworkImageProvider(
                    profilePhotoURL,
                  ),
                ),
              ),
              SizedBox(width: 13.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      profileName,
                      style: kPostFeedbackProfileNameTextStyle.copyWith(
                          color: kTextColorBlack),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      feedbackContent,
                      style: kPostFeedbackContentTextStyle.copyWith(
                          color: kTextColorBlack),
                      maxLines: 100,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    List _feedbacksList = [
      _feedbackWidget(
        feedbackContent:
            'What an amazing article! Your post impressed me a lot. I will do my best. Thanks a lot.',
        profileName: 'James_hopeful',
        profilePhotoURL:
            'https://firebasestorage.googleapis.com/v0/b/sweaterz-flutter.appspot.com/o/sweaterz_official%2Fdefault_profile_photo%403x.png?alt=media&token=b67c2269-76f2-4025-b23e-ab275bfca1da',
      ),
      _feedbackWidget(
        feedbackContent:
            'What an amazing article! Your post impressed me a lot. I will do my best. Thanks a lot.',
        profileName: 'James_hopeful',
        profilePhotoURL:
            'https://firebasestorage.googleapis.com/v0/b/sweaterz-flutter.appspot.com/o/sweaterz_official%2Fdefault_profile_photo%403x.png?alt=media&token=b67c2269-76f2-4025-b23e-ab275bfca1da',
      ),
      _feedbackWidget(
        feedbackContent:
            'What an amazing article! Your post impressed me a lot. I will do my best. Thanks a lot.',
        profileName: 'James_hopeful',
        profilePhotoURL:
            'https://firebasestorage.googleapis.com/v0/b/sweaterz-flutter.appspot.com/o/sweaterz_official%2Fdefault_profile_photo%403x.png?alt=media&token=b67c2269-76f2-4025-b23e-ab275bfca1da',
      ),
    ];

    Widget _sportsTagClickButton = GestureDetector(
      onTap: () {
        //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
        onTapOutsideOfTextField();
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Text(
          _postData['post_sports_tag'],
          style: kSportsTagTextStyle.copyWith(color: Colors.black),
        ),
      ),
    );
    Widget _tagClickButton = Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.start,
        child: Row(
          children: [
            for (Map tag in _postData['post_tag_list'])
              GestureDetector(
                onTap: () {
                  //Todo 해당 스포츠 게시물을 모아놓은 피드로 이동
                  onTapOutsideOfTextField();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 0.0),
                  child: Text(
                    '#${tag['name_lower']}',
                    style: kTagTextStyle.copyWith(color: Colors.black),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
    AppBar _postDetailScreenAppBar = AppBar(
      elevation: 0.0,
      backgroundColor: kBackgroundWhiteColor,
      title: Row(
        children: [
          _sportsTagClickButton,
          _tagClickButton,
        ],
      ),
      iconTheme: IconThemeData(
        color: kIconGreyColor1_B2B2B2, //change your color here
      ),
    );
    Widget _inputFeedbackBottomBar = Column(
      children: [
        (isTextFieldTapped)
            ? Container(
                child: Text('Textfield Tapped!'),
              )
            : Container(),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isTextFieldTapped = true;
                    });
                    FocusScope.of(context).requestFocus(myFocusNode);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: IgnorePointer(
                      child: TextField(
                        focusNode: myFocusNode,
                        controller: feedbackController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          hintText: 'Type your feedback here...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.upload_rounded),
                  onPressed: () {
                    print("yes");
                  }),
              TextButton(
                  onPressed: () {
                    print('upload confirm');
                  },
                  child: Text('Confirm'))
            ],
          ),
        ),
      ],
    );

    Widget _postDetailScreenPost = GestureDetector(
      onTap: () {
        onTapOutsideOfTextField();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.0),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color:
                  Colors.black.withOpacity(0.16), //아래로 그림자 갈 수 있게 수정해야 할 듯...
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Container(
          color: kBackgroundWhiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              postProfileListTile(
                  email: _postData['creator_email'],
                  profileName: _postData['creator_profile_name'],
                  profilePhotoURL: _postData['creator_profile_photo_url'],
                  createdTime: _postData['created_time'],
                  viewCount: _postData['view_count']),
              Padding(
                padding: EdgeInsets.all(22.0),
                child: Text(
                  _postData['content'],
                  style: kPostBodyTextStyle,
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: VideoViewer(
                  videoDownloadURL: _postData['file_list'][0]['download_url'],
                  thumbnailDownloadURL: _postData['thumbnail_download_url'],
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 22, bottom: 22),
                child: Row(
                  children: [
                    // IconButton(
                    //   icon: true //_postData['is_like_button_pressed']
                    //       ? Icon(
                    //           CupertinoIcons.suit_heart_fill,
                    //           color: kSweaterzColor,
                    //         )
                    //       : Icon(
                    //           CupertinoIcons.suit_heart,
                    //           color: kSweaterzColor,
                    //         ),
                    //   onPressed: () {
                    //     // Todo 나중에 구현하기
                    //     // _postDataProvider.toggleLikeButton(widget.postDataIndex);
                    //     // if (_postData['is_like_button_pressed']) {
                    //     //   _postDataProvider
                    //     //       .increaseLikeCountCache(widget.postDataIndex);
                    //     //   PostDetailService().pressPostLikeButton(_postData);
                    //     // } else {
                    //     //   _postDataProvider
                    //     //       .decreaseLikeCountCache(widget.postDataIndex);
                    //     //   PostDetailService().cancelPostLikeButton(_postData);
                    //     // }
                    //   },
                    // ),
                    //SizedBox(width: 10.0),
                    Text(_postData['like_count'].toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Widget _postDetailScreenFeedbacks = GestureDetector(
      onTap: () {
        onTapOutsideOfTextField();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14, top: 18, bottom: 5),
            child: Text(
              '12 Feedbacks',
              style:
                  kPostFeedbackNumberTextStyle.copyWith(color: kTextColorBlack),
            ),
          ),
          for (Widget _feedbackComponent in _feedbacksList) _feedbackComponent,
        ],
      ),
    );

    return Scaffold(
      backgroundColor: kBackgroundWhiteColor,
      appBar: _postDetailScreenAppBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                _postDetailScreenPost,
                _postDetailScreenFeedbacks,
              ],
            ),
          ),
          _inputFeedbackBottomBar,
        ],
      ),
    );
  }
}
