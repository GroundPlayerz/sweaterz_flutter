import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/bloc/cubit/auth_cubit.dart';
import 'package:sweaterz_flutter/bloc/state/auth_state.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';
import 'package:sweaterz_flutter/networking_service/registration_service.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/registration/set_profile_name_screen.dart';
import 'package:sweaterz_flutter/view/screens/splash_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:sweaterz_flutter/view/screens/provider/user_provider.dart';
import 'package:sweaterz_flutter/view/screens/tabs/starting_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
            child: Image(
              image: AssetImage('images/logo_big@3x.png'),
            ),
          ),
          SizedBox(
            height: 154 * convertHeightRatio,
          ),
          _signInButton(context),
        ]),
      ),
    );
  }
}

Widget _signInButton(BuildContext context) {
  return BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is GoogleSignedIn) {
        BlocProvider.of<AuthCubit>(context).signInFlask();
      } else if (state is FlaskSignedIn) {
        print('[starting_screen] decideStartingPage() - go to HomeRoot()');
        print('accessToke: ${state.accessToken}');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeRoot()),
            (route) => false);
      } else if (state is FlaskSignInFailed) {
        print(
            '[starting_screen] decideStartingPage() - go to SetProfileNameScreen()');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SetProfileNameScreen()),
            (route) => false);
      } else if (state is SignedOut) {
        print('[starting_screen] decideStartingPage() - go to LoginScreen()');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    },
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.grey,
        backgroundColor: Color(0xffF8F8FA),
        side: BorderSide(color: Colors.grey[300]!, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kIphoneXHeight)),
        ),
      ),
      onPressed: () async {
        log('[login_screen] _signInButton() - onPressed activated.');
        BlocProvider.of<AuthCubit>(context).signInGoogle();
        log('[login_screen] _signInButton() - signIn() has done.');
      },
      child: Container(
        // height: 50.0,
        // width: 200,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 17, 12, 17),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage('images/google_logo@3x.png'), height: 20.0),
              SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text('Sign in with Google',
                    style: kBodyTextStyle1M.copyWith(fontSize: 16.0)),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
