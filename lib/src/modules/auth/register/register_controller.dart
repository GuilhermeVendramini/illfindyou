import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  var formKey;

  String email;

  @observable
  String password;

  saveRegisterForm() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  saveFieldEmail(String value) {
    email = value.trim();
  }

  @action
  saveFieldPassword(String value) {
    print(value);
    password = value.trim();
  }
}
