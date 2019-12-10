import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

enum LoginState { LOADING, SUCCESS, FAIL, IDLE }

abstract class _LoginController with Store {
  final _googleSignIn = GoogleSignIn();
  final _firebaseAuth = FirebaseAuth.instance;
  var formKey;
  String email;
  String message;

  @observable
  LoginState loginState = LoginState.IDLE;

  @observable
  String password;

  Future<FirebaseUser> googleSignIn() async {
    GoogleSignInAccount _user = _googleSignIn.currentUser;
    if (_user == null) _user = await _googleSignIn.signInSilently();
    if (_user == null) _user = await _googleSignIn.signIn();
    if (await _firebaseAuth.currentUser() == null) {
      GoogleSignInAuthentication credentials = await _user.authentication;
      await _firebaseAuth.signInWithCredential(GoogleAuthProvider.getCredential(
          idToken: credentials.idToken, accessToken: credentials.accessToken));
    }

    return await _firebaseAuth.currentUser();
  }

  saveFieldEmail(String value) {
    email = value.trim();
  }

  saveFieldPassword(String value) {
    password = value.trim();
  }

  @action
  Future<LoginState> saveLoginForm() async {
    message = '';
    final _form = formKey.currentState;
    try {
      if (_form.validate()) {
        loginState = LoginState.LOADING;
        _form.save();
        String userId = await signUp(email, password);
        if (userId.isNotEmpty) {
          loginState = LoginState.SUCCESS;
          return LoginState.SUCCESS;
        }

        loginState = LoginState.FAIL;
        return LoginState.FAIL;
      }
    } catch (e) {
      List<String> error = e.toString().split(',');

      if (error[1] != null && error[1].isNotEmpty) {
        message = error[1];
      }

      print('login_controller - saveLoginForm(): $e');
      loginState = LoginState.FAIL;
      return LoginState.FAIL;
    }

    return LoginState.IDLE;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }
}
