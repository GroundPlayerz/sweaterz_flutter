import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sweaterz_flutter/bloc/cubit/sports_following_cubit.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:sweaterz_flutter/view/screens/widget/sports_button_list_widget.dart';
import '../components/rounded_color_button.dart';
import '../components/rounded_outlined_button.dart';

class FollowSportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SportsFollowingCubit>(context)
        .getSportsWithFollowingSports();

    var mediaQuery = MediaQuery.of(context);
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListView(
              children: [
                SizedBox(height: 70 * convertHeightRatio),
                Text(
                  'Follow your sports!',
                  style: kBigTitleTextStyle,
                ),
                Text(
                  'You can follow your sports which you are interested in. You can check and add more sports in app!',
                  style: kBodyTextStyle1M.copyWith(color: kGreyColor1_767676),
                ),
                SizedBox(height: 20 * convertHeightRatio),
                SportsFollowingListWidget(),
                SizedBox(height: 30 * convertHeightRatio),
                roundedColorButton(
                  textContent: 'Next',
                  isButtonEnabled: true,
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeRoot()),
                        (route) => false);
                  },
                ),
                SizedBox(height: 10 * convertHeightRatio),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
