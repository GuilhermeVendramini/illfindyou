import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/modules/auth/register/register_controller.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/validators/default_validators.dart';
import 'package:illfindyou/src/shared/widgets/components/default-raised-button.dart';
import 'package:illfindyou/src/shared/widgets/fields/default-text-form-field.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<RegisterController>(context);
    _controller.formKey = _formKey;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DefaultTextFormField(
            textInputType: TextInputType.emailAddress,
            hintText: Strings.authEmail,
            icon: Icons.email,
            onSaved: _controller.saveFieldEmail,
            validator: DefaultValidators.isEmail,
          ),
          DefaultTextFormField(
            obscureText: true,
            hintText: Strings.authPassword,
            icon: Icons.lock,
            onChanged: _controller.saveFieldPassword,
            validator: DefaultValidators.password,
          ),
          Observer(
            builder: (_) {
              return DefaultTextFormField(
                enabled: _controller.password != null ? true : false,
                obscureText: true,
                hintText: Strings.authConfirmPassword,
                icon: Icons.lock,
                onSaved: (_) {},
                validator: (value) {
                  return DefaultValidators.confirmPassword(
                      value, _controller.password);
                },
              );
            },
          ),
          SizedBox(
            height: 40.0,
          ),
          DefaultRaisedButton(
            onPressed: _controller.saveRegisterForm,
            text: Strings.authCreateAccount,
          ),
        ],
      ),
    );
  }
}
