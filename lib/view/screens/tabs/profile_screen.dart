import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
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
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;
    final memberProvider = Provider.of<MemberProvider>(context, listen: true);
    String profileScreenFollowingSportsList = memberProvider.followingSports
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');
    String profileScreenProfileName = memberProvider.profileName!;
    String profileScreenFollowerCount =
        memberProvider.followerMembers!.length.toString();
    String profileScreenFollowingCount =
        memberProvider.followingMembers!.length.toString();

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(profileScreenFollowingSportsList),
              Image(
                image: CachedNetworkImageProvider(
                  memberProvider.profilePhotoURL!,
                ),
                fit: BoxFit.fitWidth,
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
