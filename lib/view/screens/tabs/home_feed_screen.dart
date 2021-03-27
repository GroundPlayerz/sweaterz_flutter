import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_service/feed_service.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';
import 'package:sweaterz_flutter/networking_service/upload_post_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/components/sign_out_button.dart';
import 'package:sweaterz_flutter/view/screens/provider/following_feed_provider.dart';
import 'package:sweaterz_flutter/view/screens/provider/member_provider.dart';
import 'package:sweaterz_flutter/view/screens/login_screen.dart';
import 'package:sweaterz_flutter/view/screens/widget/sports_button_list_widget.dart';

import '../splash_screen.dart';

class HomeFeedScreen extends StatefulWidget {
  @override
  _HomeFeedScreenState createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => addListenerToScrollController(context));
  }

  addListenerToScrollController(BuildContext context) {
    Provider.of<FollowingFeedProvider>(context, listen: false)
        .fetchNewPostWidget(context);
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        Provider.of<FollowingFeedProvider>(context, listen: false)
            .fetchNewPostWidget(context);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final followingFeedProvider =
        Provider.of<FollowingFeedProvider>(context, listen: true);
    // var mediaQuery = MediaQuery.of(context);
    // double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leadingWidth: 2000,
        leading: SizedBox(
          width: 2000,
          child: Image(
            image: AssetImage('images/logo_small@3x.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        //로고
        actions: [
          Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.home,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.home,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.home,
            ),
          ),
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
        //shadowColor: Colors.white.withOpacity(0.0),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Home Feed',
                style: kBigTitleTextStyle,
              ),
              signOutButton(context),
              Text(
                  '${Provider.of<MemberProvider>(context).email} has logged in'),
              Text(Provider.of<MemberProvider>(context).profileName),
              Expanded(
                  child: followingFeedProvider.postWidgetList.length == 0
                      ? Center(
                          child: Text('No Data ...'),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount:
                              followingFeedProvider.postWidgetList.length,
                          itemBuilder: (context, index) {
                            return followingFeedProvider.postWidgetList[index];
                          },
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
