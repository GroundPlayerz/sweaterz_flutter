import 'package:dio/dio.dart';
import 'package:sweaterz_flutter/api_provider/auth_api_provider.dart';
import 'package:sweaterz_flutter/model/token/token.dart';
import 'package:sweaterz_flutter/model/user/user.dart';

import '../config.dart';

class AuthRepository {
  final authApiProvider = AuthApiProvider();

  Future<Response> signUp({required String profileName}) async {
    return await authApiProvider.signUp(profileName: profileName);
  }

  bool isGoogleSignedIn() => authApiProvider.isGoogleSignedIn();

  Future<void> googleSignIn() async => await authApiProvider.googleSignIn();

  Future<Response> flaskSignIn() async => await authApiProvider.flaskSignIn();

  Future<void> signOut() async => authApiProvider.signOut();
}
