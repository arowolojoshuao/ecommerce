// Light Mode
import 'package:ecomers_app/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.rubikTextTheme(
      Theme.of(context).textTheme,
    ),
    appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
    primaryColor: kPrimaryLightColor,
    buttonColor: kPrimaryLightColor,
    errorColor: kErrorLightColor,
    primarySwatch: Colors.deepPurple,
    accentColor: kBackgroundDarkColor,
    hintColor: kFontSecondaryLightColor,
    cardColor: kCardLightColor,
    brightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryLightColor,
    ),
    unselectedWidgetColor: kUnselectedLightColor,
    scaffoldBackgroundColor: kBackgroundLightColor,
    backgroundColor: kBackgroundLightColor,
    iconTheme: IconThemeData(color: kBackgroundDarkColor),
    primaryIconTheme: IconThemeData(color: kBackgroundDarkColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    indicatorColor: kPrimaryLightColor,
    buttonTheme: ButtonThemeData(
      // minWidth: 120.0,
      // height: 45.0,
      buttonColor: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}

/// Dark Mode
ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.rubikTextTheme(
      Theme.of(context).textTheme,
    ),
    appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
    primaryColor: kPrimaryDarkColor,
    buttonColor: kPrimaryDarkColor,
    errorColor: kErrorDarkColor,
    accentColor: kBackgroundLightColor,
    hintColor: kFontSecondaryDarkColor,
    cardColor: kCardDarkColor,
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryDarkColor,
    ),
    unselectedWidgetColor: kUnselectedDarkColor,
    scaffoldBackgroundColor: kBackgroundDarkColor,
    backgroundColor: kBackgroundDarkColor,
    iconTheme: IconThemeData(color: kPrimaryLightColor),
    primaryIconTheme: IconThemeData(color: kPrimaryLightColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    indicatorColor: kPrimaryDarkColor,
    buttonTheme: ButtonThemeData(
      minWidth: 120.0,
      height: 45.0,
      buttonColor: kPrimaryDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
  );
}
