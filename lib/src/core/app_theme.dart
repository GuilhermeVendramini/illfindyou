import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData themeData = ThemeData(
    buttonColor: DefaultColors.primary,
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
