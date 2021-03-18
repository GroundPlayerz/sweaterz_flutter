import 'package:flutter/material.dart';
import '../../constants/constants.dart';

Widget roundedOutlinedButton(
    {String textContent, bool isButtonEnabled, Function onPressed}) {
  return Container(
    width: double.infinity,
    height: 40.0,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.red,
        backgroundColor: Colors.white,
        side: BorderSide(color: kSweaterzColor, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      onPressed: isButtonEnabled ? onPressed : null,
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(textContent,
                  style: kBodyTextStyle1R.copyWith(
                      fontSize: 16.0, color: kSweaterzColor)),
            )
          ],
        ),
      ),
    ),
  );
}
