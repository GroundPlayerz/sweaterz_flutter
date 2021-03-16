import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/networking_api/login_api.dart';
import 'package:sweaterz_flutter/view/constants.dart';

class HomeFeedScreen extends StatefulWidget {
  @override
  _HomeFeedScreenState createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
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
                'Local feed screen',
                style: kBigTitleTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
