import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweaterz_flutter/view/screens/registration/follow_sports_screen.dart';

import '../../constants/constants.dart';
import '../components/rounded_color_button.dart';

class RegistrationCompleteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity),
                SizedBox(height: 90 * convertHeightRatio),
                Row(
                  children: [
                    Text(
                      'You are now Sweaterz!',
                      style: kBigTitleTextStyle,
                    ),
                    Container(
                      height: 42.0 * convertHeightRatio,
                      //padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Image(
                        image: AssetImage('images/sign_up_dancing@3x.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8 * convertHeightRatio),
                Text(
                  'Congratulation! You are the member of Sweaterz. Please upload your passionate stories on our app. We hope you enjoy Sweaterz!',
                  style: kBodyTextStyle1M.copyWith(color: kGreyColor1_767676),
                ),
                SizedBox(height: 90 * convertHeightRatio),
                roundedColorButton(
                  textContent: 'Next',
                  isButtonEnabled: true,
                  onPressed: () async {
                    Get.offAll(() => FollowSportsScreen());
                  },
                ),
                Container(
                  height: 42.0 * convertHeightRatio,
                  //padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Image(
                    image: AssetImage('images/sign_up_dancing@3x.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
