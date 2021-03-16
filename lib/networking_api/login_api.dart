import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweaterz_flutter/networking_service/login_service.dart';

class LoginAPI {
  Future<void> logIn() async {
    return LoginService().logIn();
  }

  void logOut() async {
    LoginService().logOut();
  }

  Future<bool> isLoggedIn() async {
    return LoginService().isLoggedIn();
  }

  Future<User> getCurrentUser() async {
    return LoginService().getCurrentUser();
  }
}
