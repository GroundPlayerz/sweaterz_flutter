import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';

class LetterFeedScreen extends StatefulWidget {
  @override
  _LetterFeedScreenState createState() => _LetterFeedScreenState();
}

class _LetterFeedScreenState extends State<LetterFeedScreen> {
  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    // double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Letter feed screen',
                style: kBigTitleTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
