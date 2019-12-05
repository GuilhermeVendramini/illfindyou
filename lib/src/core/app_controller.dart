import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {

  _AppController() {
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
