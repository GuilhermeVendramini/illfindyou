import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData themeData = ThemeData(
    textTheme: TextTheme(
      title: TextStyle(fontWeight: FontWeight.w300),
      subhead: TextStyle(fontWeight: FontWeight.w300),
      body1: TextStyle(fontWeight: FontWeight.w300),
      button: TextStyle(fontWeight: FontWeight.w300),
      body2: TextStyle(fontWeight: FontWeight.w300),
      caption: TextStyle(fontWeight: FontWeight.w300),
      display1: TextStyle(fontWeight: FontWeight.w300),
      display2: TextStyle(fontWeight: FontWeight.w300),
      display3: TextStyle(fontWeight: FontWeight.w300),
      display4: TextStyle(fontWeight: FontWeight.w300),
      headline: TextStyle(fontWeight: FontWeight.w300),
      overline: TextStyle(fontWeight: FontWeight.w300),
      subtitle: TextStyle(fontWeight: FontWeight.w300),
    ),
    dividerColor: DefaultColors.grey,
    scaffoldBackgroundColor: DefaultColors.black,
    appBarTheme: AppBarTheme(
      color: DefaultColors.black,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(color: DefaultColors.white, width: 0.5),
      ),
      padding: EdgeInsets.all(12.0),
      buttonColor: DefaultColors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    errorColor: DefaultColors.red,
    cursorColor: DefaultColors.white,
    toggleableActiveColor: DefaultColors.white,
    brightness: Brightness.dark,
    accentColor: DefaultColors.white,
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(
        color: DefaultColors.red,
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: DefaultColors.red,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: DefaultColors.red,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: Colors.black,
      backgroundColor: DefaultColors.white,
    ),
  );

  static get systemChrome {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: DefaultColors.black,
      ),
    );
  }
}
