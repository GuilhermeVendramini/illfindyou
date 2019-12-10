import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/core/app_module.dart';
import 'package:illfindyou/src/modules/auth/login/login_controller.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/validators/default_validators.dart';
import 'package:illfindyou/src/shared/widgets/components/default-raised-button.dart';
import 'package:illfindyou/src/shared/widgets/components/default-snack-bar.dart';
import 'package:illfindyou/src/shared/widgets/fields/default-text-form-field.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<LoginController>(context);
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
            onSaved: _controller.saveFieldPassword,
            validator: DefaultValidators.password,
          ),
          SizedBox(
            height: 40.0,
          ),
          Observer(
            builder: (_) {
              return Container(
                child: _controller.loginState == LoginState.LOADING
                    ? CircularProgressIndicator()
                    : DefaultRaisedButton(
                        text: Strings.authSign,
                        onPressed: () async {
                          LoginState _result =
                              await _controller.saveLoginForm();

                          if (_controller.message != null &&
                              _controller.message.isNotEmpty) {
                            final SnackBar _snackBar = DefaultSnackBar(
                              content: Text(_controller.message),
                            );
                            Scaffold.of(context).showSnackBar(_snackBar);
                          }

                          if (_result == LoginState.SUCCESS) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppModule()),
                            );
                          }
                        },
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
