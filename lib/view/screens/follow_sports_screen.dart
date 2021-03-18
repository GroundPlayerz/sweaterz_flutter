import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sweaterz_flutter/networking_api/registration_api.dart';
import 'package:sweaterz_flutter/networking_api/tag_api.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_feed_screen.dart';
import 'package:sweaterz_flutter/view/screens/registration_complete_screen.dart';
import 'components/rounded_color_button.dart';
import 'components/rounded_outlined_button.dart';

class FollowSportsScreen extends StatefulWidget {
  @override
  _FollowSportsScreenState createState() => _FollowSportsScreenState();
}

class _FollowSportsScreenState extends State<FollowSportsScreen> {
  final TextEditingController profileNameController = TextEditingController();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity),
                SizedBox(height: 90 * convertHeightRatio),
                Text(
                  'Follow your sports!',
                  style: kBigTitleTextStyle,
                ),
                SizedBox(height: 8 * convertHeightRatio),
                Text(
                  'You can follow your sports which you are interested in. You can check and add more sports in app!',
                  style: kBodyTextStyle1M.copyWith(color: kGreyColor2_767676),
                ),
                SizedBox(height: 90 * convertHeightRatio),
                //TODO: 스포츠 리스트 버튼 추가, 버튼 클릭하면 걔 저장
                FutureBuilder<List<Map>>(
                    future: TagAPI().getAllSports(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Map> sportsList = snapshot.data;
                        // return makeAllSportsListMapToButtons(sportsMap)[0];
                        return ListView(
                          children: [
                            for (Map map in sportsList)
                              TextButton(
                                onPressed: () {
                                  print('yes');
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.red,
                                  backgroundColor: Colors.grey[700],
                                  //side: BorderSide(color: kSweaterzColor, width: 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(kIphoneXHeight)),
                                  ),
                                ),
                                child: Text(map['name']),
                              )
                          ],
                        );
                        //TODO: sportsMap을 버튼으로만드는위젯
                      }
                      return null; // 지우기
                    }),
                roundedColorButton(
                  textContent: 'Done',
                  isButtonEnabled: true,
                  onPressed: () async {
                    //TODO: DB에 팔로잉 스포츠 추가하기.
                    Get.offAll(() => HomeFeedScreen());
                  },
                ),
                SizedBox(height: 10 * convertHeightRatio),
                roundedOutlinedButton(
                  textContent: 'Skip and set later',
                  isButtonEnabled: true,
                  onPressed: () async {
                    Get.offAll(() => HomeFeedScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
