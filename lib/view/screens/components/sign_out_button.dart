import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sweaterz_flutter/bloc/cubit/auth_cubit.dart';
import 'package:sweaterz_flutter/bloc/state/auth_state.dart';

Widget signOutButton(BuildContext context) {
  return BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is SignedOut) {
        Phoenix.rebirth(context);
      }
    },
    child: OutlinedButton(
      // splashColor: Colors.grey,
      onPressed: () async {
        print('[sign_out_button] onpressed() function activated.');
        BlocProvider.of<AuthCubit>(context).signOut();
      },
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      // highlightElevation: 0,
      // borderSide: BorderSide(color: Colors.grey),
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
    ),
  );
}
