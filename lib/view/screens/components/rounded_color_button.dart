import 'package:flutter/material.dart';
import '../../constants/constants.dart';

Widget roundedColorButton(
    {required String textContent,
    bool isButtonEnabled = true,
    required VoidCallback onPressed}) {
  return Container(
    height: 40.0,
    width: double.infinity,
    child: TextButton(
      style: TextButton.styleFrom(
        primary: Colors.red,
        //visualDensity: ,
        backgroundColor:
            isButtonEnabled ? kSweaterzColor : kSweaterzColor.withOpacity(0.4),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
      ), //styleFrom
      onPressed: isButtonEnabled ? onPressed : null,
      child: Center(
        child: Text(textContent,
            style:
                kBodyTextStyle1R.copyWith(fontSize: 16.0, color: Colors.white)),
      ),
    ),
  );
}
