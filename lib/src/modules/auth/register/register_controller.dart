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

  @observable
  String message;

  @action
  Future<RegisterState> saveRegisterForm() async {
    message = '';
    final _form = formKey.currentState;
    try {
      if (_form.validate()) {
        registerState = RegisterState.LOADING;
        _form.save();
        String userId = await signUp(email, password);
        if (userId.isNotEmpty) {
          registerState = RegisterState.SUCCESS;
          return RegisterState.SUCCESS;
        }

        registerState = RegisterState.FAIL;
        return RegisterState.FAIL;
      }
    } catch (e) {
      List<String> error = e.toString().split(',');

      if (error[1] != null && error[1].isNotEmpty) {
        message = error[1];
      }

      print('register_controller - saveRegisterForm(): $e');
      registerState = RegisterState.FAIL;
      return RegisterState.FAIL;
    }

    return RegisterState.IDLE;
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
