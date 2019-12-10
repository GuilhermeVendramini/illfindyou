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

  @observable
  String userName;

  @action
  Future<Null> _loadCurrentUser() async {
    try {
      user = await _firebaseAuth.currentUser();

      if (user != null) {
        userName = user.displayName != null ? user.displayName : user.email;
      }
    } catch (e) {
      print('app_controller - loadCurrentUser(): $e');
    }

    currentUserVerified = true;

    if (user == null) {
      _startAnimation();
    }
  }

  @action
  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print('app_controller - logout(): $e');
      return false;
    }
  }

  @action
  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      startedAnimation = true;
    });
  }
}
