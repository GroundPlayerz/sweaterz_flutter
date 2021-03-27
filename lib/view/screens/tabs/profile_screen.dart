import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                'Profile tab screen',
                style: kBigTitleTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
