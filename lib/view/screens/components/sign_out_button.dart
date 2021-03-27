import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';
import 'package:sweaterz_flutter/view/screens/login_screen.dart';
import 'package:sweaterz_flutter/view/screens/provider/member_provider.dart';

Widget signOutButton(BuildContext context) {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () async {
      Get.offAll(() => LoginScreen());
      LoginService().logOut();
      Provider.of<MemberProvider>(context).initialize();
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
