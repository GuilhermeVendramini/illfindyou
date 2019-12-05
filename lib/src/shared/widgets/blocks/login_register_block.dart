import 'package:flutter/material.dart';
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
            buttonWidth: 150.0,
            onPressed: () {
              print('done');
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          DefaultRaisedButton(
            text: Strings.authRegister,
            buttonColor: DefaultColors.black,
            textColor: DefaultColors.white,
            buttonWidth: 150.0,
            onPressed: () {
              print('done');
            },
          ),
        ],
      ),
    );
  }
}
