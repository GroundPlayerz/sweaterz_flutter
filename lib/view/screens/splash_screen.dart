import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';
import 'package:sweaterz_flutter/networking_service/member_service.dart';
import 'package:sweaterz_flutter/networking_service/registration_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/provider/home_feed_provider.dart';
import 'package:sweaterz_flutter/view/screens/provider/member_provider.dart';
import 'package:sweaterz_flutter/view/screens/login_screen.dart';
import 'package:sweaterz_flutter/view/screens/set_profile_name_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_feed_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with ChangeNotifier {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    Future.microtask(() {
      _init(context);
    });
    super.initState();
  }

  void _init(context) async {
    String _nextScreenRoute;
    //print(await LoginAPI().isLoggedIn());
    if (await LoginService().isLoggedIn()) {
      if (await RegistrationService().isRegistered()) {
        await Provider.of<MemberProvider>(context, listen: false)
            .setLoggedInMemberProvider();
        // Provider.of<FollowingFeedProvider>(context, listen: false)
        //     .fetchNewPostWidget(context);
        Future.delayed(Duration(seconds: 1), () {
          Get.offAll(() => HomeRoot());
        });
      } else {
        Get.offAll(() => SetProfileNameScreen());
      }
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;
    // double convertWidthRatio = mediaQuery.size.width / kIphoneXWidth;
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 329 * convertHeightRatio,
          ),
          Container(
            height: 34.0,
            //padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Image(image: AssetImage('images/logo_big@3x.png')),
          ),
          SizedBox(
            height: 375.8 * convertHeightRatio,
          ),
          Container(
            height: 20.0,
            child: Image(
              image: AssetImage('images/gpz_logo@3x.png'),
            ),
          ),
        ]),
      ),
    );
  }
}
