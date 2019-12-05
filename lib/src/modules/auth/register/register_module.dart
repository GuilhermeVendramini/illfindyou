import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'register_controller.dart';
import 'register_page.dart';

class RegisterModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RegisterController>(create: (_) => RegisterController()),
      ],
      child: RegisterPage(),
    );
  }
}
