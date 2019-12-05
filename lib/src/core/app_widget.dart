import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/modules/home/home_module.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:provider/provider.dart';

import 'app_controller.dart';
import 'app_page.dart';
import 'app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.systemChrome;

    final _controller = Provider.of<AppController>(context);

    return MaterialApp(
      theme: AppTheme.themeData,
      title: Strings.appTitle,
      home: Observer(
        builder: (_) {
          return _controller.user != null ? HomeModule() : AppPage();
        },
      ),
    );
  }
}
