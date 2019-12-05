import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData themeData = ThemeData(
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(color: DefaultColors.white),
      ),
      padding: EdgeInsets.all(12.0),
      buttonColor: DefaultColors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    errorColor: DefaultColors.red,
    cursorColor: DefaultColors.primary,
    toggleableActiveColor: DefaultColors.primary,
    brightness: Brightness.dark,
    accentColor: DefaultColors.primary,
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
      backgroundColor: DefaultColors.primary,
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
