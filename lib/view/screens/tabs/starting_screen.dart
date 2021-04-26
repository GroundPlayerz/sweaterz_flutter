import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/bloc/cubit/auth_cubit.dart';
import 'package:sweaterz_flutter/bloc/state/auth_state.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';
import 'package:sweaterz_flutter/networking_service/registration_service.dart';
import 'package:sweaterz_flutter/view/screens/provider/user_provider.dart';
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
        return Center(child: const CircularProgressIndicator());
      }),
    );
  }
}
