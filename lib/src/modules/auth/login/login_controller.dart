import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final _googleSignIn = GoogleSignIn();
  final _firebaseAuth = FirebaseAuth.instance;

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
}
