import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(create: (_) => LoginController()),
      ],
      child: LoginPage(),
    );
  }
}
