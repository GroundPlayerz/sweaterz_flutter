import 'package:flutter/material.dart';
import '../../constants/constants.dart';

Widget roundedColorButton(
    {String textContent, bool isButtonEnabled, Function onPressed}) {
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(textContent,
                style: kBodyTextStyle1R.copyWith(
                    fontSize: 16.0, color: Colors.white)),
          )
        ],
      ),
    ),
  );
}
