import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  _AppController() {
    if (user == null) {
      _loadCurrentUser();
    }
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @observable
  bool startedAnimation = false;

  @observable
  FirebaseUser user;

  @observable
  bool currentUserVerified = false;

  @action
  Future<Null> _loadCurrentUser() async {
    user = await _firebaseAuth.currentUser();
    currentUserVerified = true;

    if (user == null) {
      _startAnimation();
    }
  }

  @action
  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      startedAnimation = true;
    });
  }
}
