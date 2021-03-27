import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_feed_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:sweaterz_flutter/view/screens/widget/sports_button_list_widget.dart';
import 'components/rounded_color_button.dart';
import 'components/rounded_outlined_button.dart';

class FollowSportsScreen extends StatefulWidget {
  @override
  _FollowSportsScreenState createState() => _FollowSportsScreenState();
}

class _FollowSportsScreenState extends State<FollowSportsScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Follow your sports!',
                  style: kBigTitleTextStyle,
                ),

                Text(
                  'You can follow your sports which you are interested in. You can check and add more sports in app!',
                  style: kBodyTextStyle1M.copyWith(color: kGreyColor2_767676),
                ),
                SizedBox(height: 90 * convertHeightRatio),
                //TODO: 스포츠 리스트 버튼 추가, 버튼 클릭하면 걔 저장
                SportsFollowsListWidget(),
                roundedColorButton(
                  textContent: 'Done',
                  isButtonEnabled: true,
                  onPressed: () async {
                    //TODO: DB에 팔로잉 스포츠 추가하기.
                    Get.offAll(() => HomeRoot());
                  },
                ),
                Container(
                  height: 40.0,
                  child: roundedOutlinedButton(
                    textContent: 'Skip and set later',
                    isButtonEnabled: true,
                    onPressed: () async {
                      Get.offAll(() => HomeRoot());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
