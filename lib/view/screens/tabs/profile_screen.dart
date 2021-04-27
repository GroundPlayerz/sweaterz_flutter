import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/bloc/cubit/profile_screen_cubit.dart';
import 'package:sweaterz_flutter/bloc/state/profile_screen_state.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/model/user/user.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/constants/text_styles.dart';
import 'package:sweaterz_flutter/view/screens/components/sign_out_button.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileScreenCubit>(context).getUserProfile();
  }

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
            return BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
                builder: (context, state) {
              if (state is Loaded) {
                final User user = state.user;
                final List<Sports> userFollowingSports =
                    state.followingSportsList;
                final String userFollowingSportsString =
                    userFollowingSports.map<String>((e) => e.name).join(",  ");
                final List<User> following = state.following;
                final List<User> followers = state.followers;

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
                              image: CachedNetworkImageProvider(
                                user.profilePhotoUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
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
                                userFollowingSportsString,
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
                                  user.profileName,
                                  style: kProfileScreenProfileNameTextStyle,
                                ),
                              ), //프로필 이름
                              Padding(
                                //팔로워, 팔로잉
                                padding: const EdgeInsets.only(top: 14),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          followers.length.toString(),
                                          style:
                                              kProfileScreenFollowNumberTextStyle,
                                        ),
                                        Text(
                                          'Followers',
                                          style:
                                              kProfileScreenFollowTextTextStyle
                                                  .copyWith(
                                                      color:
                                                          kGreyColor2_999999),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 25.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          following.length.toString(),
                                          style:
                                              kProfileScreenFollowNumberTextStyle,
                                        ),
                                        Text(
                                          'Following',
                                          style:
                                              kProfileScreenFollowTextTextStyle
                                                  .copyWith(
                                                      color:
                                                          kGreyColor2_999999),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ), //팔로워, 팔로잉
                              Padding(
                                padding: const EdgeInsets.only(top: 17.0),
                                child: Text(
                                  user.profileIntroduction,
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
              } else if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Error) {
                log(state.message);
                return Container(child: Text(state.message));
              }
              return Container(child: Text('here'));
            });
          },
        ),
      );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final memberProvider = Provider.of<MemberProvider>(context, listen: true);
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
