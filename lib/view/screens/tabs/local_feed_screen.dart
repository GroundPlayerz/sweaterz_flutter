import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';

class LocalFeedScreen extends StatefulWidget {
  @override
  _LocalFeedScreenState createState() => _LocalFeedScreenState();
}

class _LocalFeedScreenState extends State<LocalFeedScreen> {
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
