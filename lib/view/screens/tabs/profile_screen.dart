import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/components/sign_out_button.dart';
import 'package:sweaterz_flutter/view/screens/provider/member_provider.dart';
import 'package:sweaterz_flutter/view/screens/widget/sports_button_list_widget.dart';
import 'package:sweaterz_flutter/networking_service/member_service.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _sampleText = '';

  @override
  void initState() {
    super.initState();
    // _fetchPost();
  }

  // void _fetchPost() async {
  //   final response =
  //       await http.get(Uri.parse('http://$kIPAddress/api/user-list'));
  //   setState(() {
  //     _sampleText = response.body;
  //     print(_sampleText);
  //   });
  //   List jsonResult = jsonDecode(_sampleText);
  //   print(jsonResult);
  // }

  Widget _profileScreenSliverAppBar = SliverAppBar(
    toolbarHeight: 10,
    //collapsedHeight: 40,
    expandedHeight: 10,
    backgroundColor: kBackgroundWhiteColor,
    floating: true,
    pinned: true,

    bottom: TabBar(
      labelStyle: TextStyle(color: Colors.black),
      labelColor: Colors.black,
      unselectedLabelColor: kGreyColor2_999999,
      indicatorColor: Colors.transparent,
      tabs: [
        Tab(
          icon: Icon(CupertinoIcons.doc_on_doc),
        ),
        Tab(icon: Icon(CupertinoIcons.graph_square_fill)),
      ],
    ),
  );

  Widget get _profileScreenProfileBox => SliverToBoxAdapter(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var mediaQuery = MediaQuery.of(context);
            double topSafeAreaLength = mediaQuery.padding.top;
            double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
            final memberProvider =
                Provider.of<MemberProvider>(context, listen: true);
            String profileScreenFollowingSportsList = memberProvider
                .followingSports
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '');
            String profileScreenProfileName = memberProvider.profileName!;
            String profileScreenFollowerCount = "12";
            String profileScreenFollowingCount = "128";
            String profileScreenIntroduction =
                "KAIST 17 Basketball Team. Now planning to win the KAIST & POSTECH War.\n- KAIST Basketball team Ace🌟\n- Training Jiu-Jitsu(White Belt)";

            return Column(
              children: [
                signOutButton(context),
                SizedBox(
                  height: mediaQuery.size.width,
                  width: mediaQuery.size.width,
                  child: Stack(
                    children: [
                      Container(
                        height: mediaQuery.size.width,
                        width: mediaQuery.size.width,
                        child: Image(
                          image:
                              AssetImage('images/yunji_profile_test_image.jpg'),
                          // image: CachedNetworkImageProvider(
                          //   memberProvider.profilePhotoURL!,
                          // ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Stack(
                      //   //위에 Stack
                      //   children: [
                      //     Container(
                      //       color: kBackgroundWhiteColor.withOpacity(0.6),
                      //       height: topSafeAreaLength + 44,
                      //       //그림자?
                      //       //width: mediaQuery.size.width,
                      //     ),
                      //     Positioned(
                      //       left: 19,
                      //       bottom: 13,
                      //       child: Text(
                      //         "My Ground",
                      //         style: kProfileScreenTitleTextStyle.copyWith(
                      //             color: Colors.black),
                      //         maxLines: 1,
                      //         softWrap: false,
                      //         overflow: TextOverflow.ellipsis,
                      //       ),
                      //     ),
                      //     Positioned(
                      //       right: 5,
                      //       bottom: 0,
                      //       child: IconButton(
                      //         icon: Icon(
                      //           Icons.more_horiz_sharp,
                      //         ),
                      //         onPressed: () {},
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        //아래 박스랑 스포츠
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.white.withAlpha(0),
                              Colors.white12,
                              Colors.white54,
                              kBackgroundWhiteColor,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 19.0),
                          child: Text(
                            profileScreenFollowingSportsList,
                            style: kProfileScreenFollowingSportsTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(children: [
                  Container(
                    color: kBackgroundWhiteColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              profileScreenProfileName,
                              style: kProfileScreenProfileNameTextStyle,
                            ),
                          ), //프로필 이름
                          Padding(
                            //팔로워, 팔로잉
                            padding: const EdgeInsets.only(top: 14),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profileScreenFollowerCount,
                                      style:
                                          kProfileScreenFollowNumberTextStyle,
                                    ),
                                    Text(
                                      'Followers',
                                      style: kProfileScreenFollowTextTextStyle
                                          .copyWith(color: kGreyColor2_999999),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 25.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profileScreenFollowingCount,
                                      style:
                                          kProfileScreenFollowNumberTextStyle,
                                    ),
                                    Text(
                                      'Following',
                                      style: kProfileScreenFollowTextTextStyle
                                          .copyWith(color: kGreyColor2_999999),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ), //팔로워, 팔로잉
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0),
                            child: Text(
                              profileScreenIntroduction,
                              style: kProfileScreenIntroductionTextStyle,
                              maxLines: 3,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ), //소개멘트
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      icon: Icon(
                        Icons.more_horiz_sharp,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ]),
                //Text(_sampleText),
                //요 아래는 ... 누르면 나오는 화면으로.
                //signOutButton(context),
                //Expanded(child: SportsFollowsListWidget()),
              ],
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    final memberProvider = Provider.of<MemberProvider>(context, listen: true);
    // String profileScreenFollowingSportsList = memberProvider.followingSports
    //     .toString()
    //     .replaceAll('[', '')
    //     .replaceAll(']', '');
    // String profileScreenProfileName = memberProvider.profileName!;
    // String profileScreenFollowerCount = "12";
    // String profileScreenFollowingCount = "128";
    // String profileScreenIntroduction =
    //     "KAIST 17 Basketball Team. Now planning to win the KAIST & POSTECH War.\n- KAIST Basketball team Ace🌟\n- Training Jiu-Jitsu(White Belt)";

    return Scaffold(
      backgroundColor: kBackgroundWhiteColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              _profileScreenProfileBox,
              _profileScreenSliverAppBar,
            ];
          },
          body: TabBarView(children: [
            buildImages(),
            buildImages(),
          ]),
        ),
      ),
    );
  }

  Widget buildImages() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 20,
        itemBuilder: (context, index) => ImageWidget(index: index),
      );
}

class ImageWidget extends StatelessWidget {
  final int index;

  ImageWidget({
    required this.index,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        width: double.infinity,
        child: Card(
          child: Image.network(
            'https://source.unsplash.com/random?sig=$index',
            fit: BoxFit.cover,
          ),
        ),
      );
}
