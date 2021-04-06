import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/components/sign_out_button.dart';
import 'package:sweaterz_flutter/view/screens/widget/sports_button_list_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'profile screen',
                style: kBigTitleTextStyle,
              ),
              signOutButton(context),
              SizedBox(height: 90 * convertHeightRatio),
              Text(
                'Following Sports',
                style: kBigTitleTextStyle,
              ),
              //TODO: 스포츠 리스트 버튼 추가, 버튼 클릭하면 걔 저장
              SportsFollowsListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
