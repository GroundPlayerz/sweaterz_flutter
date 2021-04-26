import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginService {
  Future<void> logIn() async {
    await _signInWithGoogle();
    final _currentUser = _auth.currentUser;
    print(_currentUser);
    if (_currentUser != null) {
      final http.Response response = await http.post(
          Uri.parse(baseUrl + '/api/auth/signin'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'email': _currentUser.email}));
      if (response.statusCode == 200) {
        print(
            '[login_service] logIn() - response1: ' + response.body.toString());
      } else {
        print(
            '[login_service] logIn() - response2: ' + response.body.toString());
      }
    }
  }

  Future<void> logOut() async {
    await _signOutGoogle();
    await _auth.signOut();
    log('[login_service] logOut() - user logged out and _auth.currentUser value is :' +
        _auth.currentUser.toString());
  }

  Future<bool> isLoggedIn() async {
    if (_auth.currentUser != null) {
      log('[login_service] isLoggedIn() - is logged in.');
      return true;
    } else {
      log('[login_service] isLoggedIn() - is not logged in.');
      return false;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      final _currentUser = _auth.currentUser;
      if (_currentUser != null) {
        // log(_currentUser.toString());
        return _currentUser;
      } else {
        log('[login_service] getCurrentUser() - There is no current user');
        return null;
      }
    } catch (e) {
      log('[login_service] getCurrentUser() -' + e.toString());
      return null;
    }
  }

  Future<void> _signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        // assert(await user.getIdToken() != null);
        final User currentUser = _auth.currentUser!;
        assert(user.uid == currentUser.uid);
        log('[login_service] _signInWithGoogle() - _signInWithGoogle succeeded: $user');
      } else {
        log('[login_service] _signInWithGoogle() - Google Sign In Failed');
      }
    } else {
      log('[login_service] _signInWithGoogle() - Google Sign In Failed');
    }
  }

  Future<void> _signOutGoogle() async {
    await _googleSignIn.signOut();
    log("[login_service] _signOutGoogle() - User Signed Out with google.");
  }
}
