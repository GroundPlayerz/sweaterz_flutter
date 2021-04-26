import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/bloc/cubit/auth_cubit.dart';
import 'package:sweaterz_flutter/repository/auth_repository.dart';
import 'package:sweaterz_flutter/view/screens/provider/home_feed_provider.dart';
import 'package:sweaterz_flutter/view/screens/provider/user_provider.dart';
import 'package:sweaterz_flutter/view/screens/registration/follow_sports_screen.dart';
import 'package:sweaterz_flutter/view/screens/provider/question_feed_provider.dart';
import 'package:sweaterz_flutter/view/screens/splash_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/login_screen.dart';
import 'package:sweaterz_flutter/view/screens/registration/registration_complete_screen.dart';
import 'package:sweaterz_flutter/view/screens/registration/set_profile_name_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:flutter/services.dart';
import 'package:sweaterz_flutter/view/screens/tabs/starting_screen.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

bool get currentIsDark => true; //Screens.mediaQuery.platformBrightness.isDark;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
  AssetPicker.registerObserve();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(repository: AuthRepository()),
      child: MultiProvider(
        providers: [
          //ChangeNotifierProvider(create: (_) => ScreenSize()),
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeFeedProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => QuestionFeedProvider(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Open_Sans',
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2:
                  TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
            ),
          ),
          title: 'Sweaterz Loading Screen',
          home: StartingScreen(),
        ),
      ),
    );
  }
}
