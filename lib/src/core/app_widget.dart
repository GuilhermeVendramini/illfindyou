import 'package:flutter/material.dart';
import 'package:illfindyou/src/modules/auth/login/login_module.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';

import 'app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.systemChrome;

    return MaterialApp(
      theme: AppTheme.themeData,
      title: Strings.appTitle,
      home: LoginModule(),
    );
  }
}
