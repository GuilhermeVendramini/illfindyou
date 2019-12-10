import 'package:flutter/material.dart';
import 'package:illfindyou/src/modules/home/home_module.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/components/default-raised-button.dart';
import 'package:illfindyou/src/shared/widgets/components/default-title.dart';
import 'package:illfindyou/src/shared/widgets/forms/login-form.dart';
import 'package:provider/provider.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<LoginController>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.authLogin),
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
                LoginForm(),
                Divider(),
                DefaultRaisedButton(
                  text: Strings.authGoogleSign,
                  textColor: DefaultColors.white,
                  buttonColor: DefaultColors.black,
                  onPressed: () async {
                    final _currentUser = await _controller.googleSignIn();
                    if (_currentUser != null) {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeModule()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
