import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.authRegister),
      ),
      body: Container(
        child: Text('Register'),
      ),
    );
  }
}
