import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_controller.dart';
import 'app_widget.dart';

class AppModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppController>(create: (_) => AppController()),
      ],
      child: AppWidget(),
    );
  }
}
