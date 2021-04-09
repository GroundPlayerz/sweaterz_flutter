import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/components/sign_out_button.dart';
import 'package:sweaterz_flutter/view/screens/provider/member_provider.dart';
import 'package:sweaterz_flutter/view/screens/widget/sports_button_list_widget.dart';
import 'package:sweaterz_flutter/networking_service/member_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double topSafeAreaLength = mediaQuery.padding.top;
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;
    final memberProvider = Provider.of<MemberProvider>(context, listen: true);
    String profileScreenFollowingSportsList = memberProvider.followingSports
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');
    String profileScreenProfileName = memberProvider.profileName!;
    String profileScreenFollowerCount = "12";
    String profileScreenFollowingCount = "128";
    String profileScreenIntroduction =
        "KAIST 17 Basketball Team. Now planning to win the KAIST & POSTECH War.\n- KAIST Basketball team Ace🌟\n- Training Jiu-Jitsu(White Belt)";

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Text(
            //   profileScreenFollowingSportsList,
            //   style: kProfileScreenFollowingSportsTextStyle,
            // ),
            // Text(
            //   profileScreenProfileName,
            //   style: kProfileScreenProfileNameTextStyle,
            // ),
            // Text(profileScreenIntroduction,
            //     style: kProfileScreenIntroductionTextStyle),
            // Text(
            //   profileScreenFollowerCount,
            //   style: kProfileScreenFollowNumberStyle,
            // ),
            // Text(
            //   profileScreenFollowingCount,
            //   style: kProfileScreenFollowNumberStyle,
            // ),
            Stack(
              children: [
                Container(
                  height: mediaQuery.size.width,
                  //width: mediaQuery.size.width,
                  child: Image(
                    image: CachedNetworkImageProvider(
                      memberProvider.profilePhotoURL!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: topSafeAreaLength + 44,
                      //그림자?
                      //width: mediaQuery.size.width,
                    ),
                    Positioned(
                      left: 15,
                      bottom: 13,
                      child: Text(
                        "My Ground",
                        style: kProfileScreenTitleTextStyle.copyWith(
                            color: Colors.black),
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        icon: Icon(
                          Icons.more_horiz_sharp,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Expanded(
            //   child: Text(
            //     maxLines: 5,
            //     softWrap: false,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            // Builder(builder:(context) {
            //   for (var i in memberProvider.followingSports)
            //     return Text('s')
            //
            // }),

            //요 아래는 ... 누르면 나오는 화면으로.
            //signOutButton(context),
            //Expanded(child: SportsFollowsListWidget()),
          ],
        ),
      ),
    );
  }
}
