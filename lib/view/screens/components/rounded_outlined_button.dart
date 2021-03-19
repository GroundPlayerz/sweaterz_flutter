import 'package:flutter/material.dart';
import '../../constants/constants.dart';

Widget roundedOutlinedButton(
    {String textContent, bool isButtonEnabled = true, Function onPressed}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
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
      child: Center(
        child: Text(textContent,
            style: kBodyTextStyle1R.copyWith(
                fontSize: 13.0, color: kSweaterzColor)),
      ),
    ),
  );
}
