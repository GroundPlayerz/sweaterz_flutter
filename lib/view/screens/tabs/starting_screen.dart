import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweaterz_flutter/bloc/cubit/auth_cubit.dart';
import 'package:sweaterz_flutter/bloc/state/auth_state.dart';
import 'package:sweaterz_flutter/view/constants/constants.dart';
import 'package:sweaterz_flutter/view/screens/registration/set_profile_name_screen.dart';
import 'package:sweaterz_flutter/view/screens/tabs/home_root.dart';
import 'package:sweaterz_flutter/view/screens/tabs/login_screen.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('[starting_screen] dispose() called.');
    super.dispose();
    print('[starting_screen] dispose() - is disposed.');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print(state);
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
      child: Builder(builder: (context) {
        BlocProvider.of<AuthCubit>(context).checkIsGoogleSignedIn();
        var mediaQuery = MediaQuery.of(context);
        double convertHeightRatio = mediaQuery.size.height / kIphoneXHeight;

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
      }),
    );
  }
}
