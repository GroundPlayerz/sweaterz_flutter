import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_api/login_api.dart';
import 'package:sweaterz_flutter/view/constants.dart';
import 'package:sweaterz_flutter/networking_api/tag_api.dart';
import 'package:sweaterz_flutter/view/model/enums.dart';
import 'package:sweaterz_flutter/view/model/member_provider.dart';
import 'package:sweaterz_flutter/view/model/member_profile.dart';
import 'package:sweaterz_flutter/view/screens/components/rounded_color_button.dart';
import 'package:sweaterz_flutter/view/screens/components/sports_button.dart';
import 'package:sweaterz_flutter/view/screens/tabs/tab_item.dart';
import 'package:sweaterz_flutter/view/screens/tabs/upload_screen.dart';

class HomeFeedScreen extends StatefulWidget {
  @override
  _HomeFeedScreenState createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;

    var _currentTab = TabItem.HOME;
    void _selectTab(TabItem tabItem) {
      setState(() {
        _currentTab = tabItem;
      });
    }

    //int _bottomNavigationBarSelectedIndex = 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Gibeom babo')),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white.withOpacity(0.98),
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xff969696),
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        iconSize: 20.0,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(
                  Icons.home,
                ),
              ),
              activeIcon: Icon(Icons.add),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(
                  Icons.home,
                ),
              ),
              activeIcon: Icon(Icons.add),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home)),
              activeIcon: Icon(Icons.add),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home)),
              activeIcon: Icon(Icons.add),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home)),
              activeIcon: Icon(Icons.add),
              label: 'Home'),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Home Feed',
                style: kBigTitleTextStyle,
              ),
              _signOutButton(),
              Text(
                  '${Provider.of<MemberProvider>(context).email} has logged in'),
              Image.network(Provider.of<MemberProvider>(context)
                  .profilePhotoURL
                  .toString()),
              Text(Provider.of<MemberProvider>(context).profileName),
              FutureBuilder<List>(
                  future: Future.wait([
                    TagAPI().getAllSports(),
                    TagAPI().getFollowingSports(),
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List sportsList = snapshot.data[0];
                      List followingSportsList = snapshot.data[1];
                      List<Widget> sportsButtonList = [];
                      for (Map map in sportsList) {
                        bool _isActivated = false;
                        if (followingSportsList.contains(map['name'])) {
                          _isActivated = true;
                        }
                        sportsButtonList.add(StatefulSportsButton(
                          sportsName: map['name'],
                          isActivated: _isActivated,
                        ));
                      }
                      return Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: sportsButtonList,
                      );
                    } else if (snapshot.hasError) {
                      return Text('error');
                    } else {
                      return Text('loading');
                    }
                  }),
              roundedColorButton(
                  textContent: 'upload_screen으로 넘어가기',
                  isButtonEnabled: true,
                  onPressed: () {
                    Get.toNamed('/upload_screen');
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _signOutButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        LoginAPI signInController = LoginAPI();
        signInController.logOut();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('images/google_logo@3x.png'), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}