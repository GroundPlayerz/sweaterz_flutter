import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/view/constants/screens.dart';
import 'package:sweaterz_flutter/view/model/member_provider.dart';
import 'package:sweaterz_flutter/view/screens/follow_sports_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_feed_screen.dart';
import 'package:sweaterz_flutter/view/screens/splash_screen.dart';
import 'package:sweaterz_flutter/view/screens/login_screen.dart';
import 'package:sweaterz_flutter/view/screens/registration_complete_screen.dart';
import 'package:sweaterz_flutter/view/screens/set_profile_name_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:sweaterz_flutter/view/screens/gallery_video_picker.dart';
import 'package:sweaterz_flutter/view/screens/tabs/upload_screen.dart';
import 'package:sweaterz_flutter/view/screens/video_upload_screen.dart';
import 'package:flutter/services.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

bool get currentIsDark => true; //Screens.mediaQuery.platformBrightness.isDark;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
  AssetPicker.registerObserve();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_) => ScreenSize()),
        ChangeNotifierProvider(
          create: (_) => MemberProvider(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          ),
        ),
        title: 'Sweaterz Loading Screen',
        home: SplashScreen(),
        getPages: [
          GetPage(
            name: '/',
            page: () => SplashScreen(),
          ),
          GetPage(
            name: '/login_screen',
            page: () => LoginScreen(),
          ),
          GetPage(
            name: '/set_profile_name_screen',
            page: () => SetProfileNameScreen(),
          ),
          GetPage(
            name: '/home_feed_screen',
            page: () => HomeRoot(),
          ),
          GetPage(
            name: '/registration_complete_screen',
            page: () => RegistrationCompleteScreen(),
          ),
          GetPage(
            name: '/follow_sports_screen',
            page: () => FollowSportsScreen(),
          ),
          GetPage(
            name: '/video_upload_screen',
            page: () => UploadScreen(),
          ),
          // GetPage(
          //   name: '/upload_screen',
          //   page: () => VideoUploadScreen(),
          // ),
        ],
      ),
    );
  }
}
