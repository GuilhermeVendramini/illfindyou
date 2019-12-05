import 'package:flutter/material.dart';
import 'package:illfindyou/src/modules/auth/login/login_module.dart';
import 'package:illfindyou/src/modules/auth/register/register_module.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/components/default-raised-button.dart';

class LoginRegisterBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          DefaultRaisedButton(
            text: Strings.authLogin,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginModule()),
              );
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          DefaultRaisedButton(
            text: Strings.authRegister,
            buttonColor: DefaultColors.black,
            textColor: DefaultColors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterModule()),
              );
            },
          ),
        ],
      ),
    );
  }
}
