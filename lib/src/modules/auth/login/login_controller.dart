import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  _LoginController() {
    _startAnimation();
  }

  @observable
  bool startedAnimation = false;

  @action
  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      startedAnimation = true;
    });
  }
}
