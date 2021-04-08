import 'package:flutter/material.dart';

const double kIphoneXHeight = 812.0;
const double kIphoneXWidth = 375.0;

const kSweaterzColor = Color(0xFFef5454);
const kDefaultColor = Colors.black;

const kGreyColor1_767676 = Color(0xFF767676);
const kGreyColor2_999999 = Color(0xFF999999);

const kIconGreyColor1_B2B2B2 = Color(0xFFB2B2B2);
const kIconGreyColor2_656565 = Color(0xff656565);

const kLightGreyColor1_EBEBEB = Color(0xFFEBEBEB);
const kLightGreyColor2_EDEDED = Color(0xffEDEDED);

const kBackgroundGreyColorOld = Color(0xffF4F5F9);
const kBackgroundGreyColor = Color(0xffFAFAFA);
const kBackgroundWhiteColor = Colors.white;

const kTextFieldRappingBoxColor = Color(0xffF1F1F5);

//const k

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

const TextStyle kPostContentTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400, //regular
  fontSize: 20.0,
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
  hintStyle: kBodyTextStyle1M.copyWith(color: kGreyColor2_999999),
  contentPadding: EdgeInsets.fromLTRB(0, 10, 10, 10),
  //border: UnderlineInputBorder(),
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.white.withOpacity(0),
    width: 2,
  )),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.white.withOpacity(0),
    width: 2,
  )),
);

final kAssetsPickerThemeData = ThemeData.light().copyWith(
  buttonColor: kSweaterzColor,
  brightness: Brightness.light,
  primaryColor: Colors.white,
  primaryColorBrightness: Brightness.light,
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.grey[900],
  accentColor: kSweaterzColor,
  accentColorBrightness: Brightness.light,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  bottomAppBarColor: Colors.white,
  cardColor: Colors.white,
  highlightColor: Colors.transparent,
  toggleableActiveColor: kSweaterzColor,
  cursorColor: kSweaterzColor,
  textSelectionColor: kSweaterzColor.withAlpha(100),
  textSelectionHandleColor: kSweaterzColor,
  indicatorColor: kSweaterzColor,
  appBarTheme: const AppBarTheme(
    brightness: Brightness.light,
    elevation: 0,
  ),
  colorScheme: ColorScheme(
    primary: Colors.white,
    primaryVariant: Colors.white,
    secondary: kSweaterzColor,
    secondaryVariant: kSweaterzColor,
    background: Colors.white,
    surface: Colors.white,
    brightness: Brightness.light,
    error: const Color(0xffcf6679),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
  ),
);

const kUploadDivider = Divider(
  height: 20,
  thickness: 1,
  indent: 0,
  endIndent: 0,
);
var kDivider = Container(
  color: kLightGreyColor1_EBEBEB,
  height: 1,
  width: double.infinity,
);
