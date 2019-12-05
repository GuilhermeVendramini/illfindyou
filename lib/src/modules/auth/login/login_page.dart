import 'package:flutter/material.dart';
import 'package:illfindyou/src/modules/home/home_module.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/components/default-raised-button.dart';
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
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                DefaultRaisedButton(
                  text: Strings.authSign,
                  onPressed: () {
                    print('Login');
                  },
                ),
                Divider(
                  height: 40.0,
                ),
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
