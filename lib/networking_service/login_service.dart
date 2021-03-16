import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginService {
  User _currentUser;

  Future<void> logIn() async {
    await _signInWithGoogle();
    _currentUser = _auth.currentUser;
  }

  void logOut() async {
    await _signOutGoogle();
    await _auth.signOut();
    _currentUser = _auth.currentUser;
    log(_currentUser.toString());
  }

  Future<bool> isLoggedIn() async {
    _currentUser = _auth.currentUser;
    if (_currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final _currentUser = _auth.currentUser;
      if (_currentUser != null) {
        // log(_currentUser.toString());
        return _currentUser;
      } else {
        log('There is no current user');
        return null;
      }
    } catch (e) {
      log('$e');
      return null;
    }
  }

  Future<void> _signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      log('_signInWithGoogle succeeded: $user');
    } else {
      log('Google Sign In Failed');
    }
  }

  Future<void> _signOutGoogle() async {
    await _googleSignIn.signOut();

    log("User Signed Out");
  }
}
