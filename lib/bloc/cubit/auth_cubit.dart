import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sweaterz_flutter/bloc/state/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:sweaterz_flutter/model/token/token.dart';
import 'package:sweaterz_flutter/model/user/user.dart';
import 'package:sweaterz_flutter/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  AuthCubit({required this.repository}) : super(SignedOut());

  signUp({required String profileName}) async {
    try {
      await this.repository.signUp(profileName: profileName);
      signInFlask();
    } catch (e) {
      if (e is DioError && e.response!.statusCode == 409) {
        emit(Error(message: 'User already exists.'));
      } else {
        emit(Error(message: e.toString()));
      }
    }
  }

  signInGoogle() async {
    try {
      await this.repository.googleSignIn();
      emit(GoogleSignedIn());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  checkIsGoogleSignedIn() async {
    try {
      if (this.repository.isGoogleSignedIn()) {
        emit(GoogleSignedIn());
      } else {
        emit(SignedOut());
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  signInFlask() async {
    try {
      final resp = await this.repository.flaskSignIn();
      final accessToken = Token.fromJson(resp.data);
      secureStorage.write(key: 'access_token', value: accessToken.accessToken);
      emit(FlaskSignedIn(accessToken: accessToken));
    } catch (e) {
      if (e is DioError && e.response!.statusCode == 404) {
        emit(FlaskSignInFailed());
      } else {
        emit(Error(message: e.toString()));
      }
    }
  }

  signOut() async {
    try {
      await this.repository.signOut();
      secureStorage.delete(key: 'access_token');
      print('Deleted access_token from Flutter Secure Storage.');
      emit(SignedOut());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
