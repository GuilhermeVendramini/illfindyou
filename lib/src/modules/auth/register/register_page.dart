import 'package:flutter/material.dart';
import 'package:illfindyou/src/modules/auth/register/register_controller.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/components/default-title.dart';
import 'package:illfindyou/src/shared/widgets/forms/register-form.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<RegisterController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.authRegister),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 80.0,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DefaultTitle(),
                _controller.registerState == RegisterState.LOADING
                    ? CircularProgressIndicator()
                    : RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
