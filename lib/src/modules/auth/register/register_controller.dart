import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

enum RegisterState { LOADING, SUCCESS, FAIL, IDLE }

abstract class _RegisterController with Store {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var formKey;
  String email;

  @observable
  RegisterState registerState = RegisterState.IDLE;

  @observable
  String password;

  saveRegisterForm() async {
    registerState = RegisterState.LOADING;
    final _form = formKey.currentState;
    try {
      if (_form.validate()) {
        _form.save();

        String userId = await signUp(email, password);
        if (userId.isNotEmpty) {
          registerState = RegisterState.SUCCESS;
          return true;
        }

        registerState = RegisterState.FAIL;
        return false;
      }
    } catch (e) {
      List<String> error = e.toString().split(',');
      print(error[1]);
      print('register_controller - saveRegisterForm(): $e');
      registerState = RegisterState.FAIL;
      return false;
    }

    return false;
  }

  saveFieldEmail(String value) {
    email = value.trim();
  }

  @action
  saveFieldPassword(String value) {
    password = value.trim();
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }
}
