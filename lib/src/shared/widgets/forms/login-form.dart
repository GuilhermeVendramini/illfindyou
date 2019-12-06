import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/components/default-raised-button.dart';
import 'package:illfindyou/src/shared/widgets/fields/default-text-form-field.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          DefaultTextFormField(
            textInputType: TextInputType.emailAddress,
            hintText: Strings.authEmail,
            icon: Icons.email,
            onSaved: (data) {},
            validator: (data) {},
          ),
          DefaultTextFormField(
            obscureText: true,
            hintText: Strings.authPassword,
            icon: Icons.lock,
            onSaved: (data) {},
            validator: (data) {},
          ),
          SizedBox(
            height: 40.0,
          ),
          DefaultRaisedButton(
            text: Strings.authSign,
            onPressed: () {
              print('Login');
            },
          ),
        ],
      ),
    );
  }
}
