import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_api/login_api.dart';
import 'package:sweaterz_flutter/view/constants.dart';

class FollowingFeedScreen extends StatefulWidget {
  @override
  _FollowingFeedScreenState createState() => _FollowingFeedScreenState();
}

class _FollowingFeedScreenState extends State<FollowingFeedScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Following feed screen',
                style: kBigTitleTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
