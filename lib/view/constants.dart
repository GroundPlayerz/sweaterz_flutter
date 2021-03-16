import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

const double kIphoneXHeight = 812.0;
const double kIphoneXWidth = 375.0;

const kSweaterzColor = Color(0xFFef5454);
const kDefaultColor = Colors.black;
const kGreyColor1 = Color(0xFF767676);
const kGreyColor2 = Color(0xFF999999);

const TextStyle kBigTitleTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontSize: 24.0,
  color: kDefaultColor,
);

const TextStyle kBodyTextStyle1M = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500, //medium
  fontSize: 16.0,
  color: kDefaultColor,
);

const TextStyle kBodyTextStyle1R = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  color: kDefaultColor,
);
//
// double kConvertHeightRatio;
// double kConvertWidthRatio;

// final TextStyle kBigTitleTextStyle = GoogleFonts.roboto(
//   // textStyle: Theme.of(context).textTheme.display1,
//   fontSize: 22.0,
//   fontWeight: FontWeight.bold,
//   fontStyle: FontStyle.normal,
// );

InputDecoration kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: kBodyTextStyle1M.copyWith(color: kGreyColor2),
  contentPadding: EdgeInsets.fromLTRB(0, 10, 10, 10),
  //border: UnderlineInputBorder(),
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xffF1F1F5),
    width: 2,
  )),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xffF1F1F5),
    width: 2,
  )),
);
