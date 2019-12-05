import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/blocks/animated-title-auth-block.dart';
import 'package:illfindyou/src/shared/widgets/components/animated-color-background.dart';
import 'package:illfindyou/src/shared/widgets/components/image-background.dart';

import 'app_theme.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.systemChrome;

    return MaterialApp(
      theme: AppTheme.themeData,
      title: Strings.appTitle,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            ImageBackground(),
            AnimatedColorBackground(),
            Align(
              alignment: Alignment.center,
              child: AnimatedTitleAuth(),
            ),
          ],
        ),
      ),
    );
  }
}
