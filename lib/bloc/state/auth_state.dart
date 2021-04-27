import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/model/token/token.dart';
import 'package:sweaterz_flutter/model/user/user.dart';

@immutable
abstract class AuthState extends Equatable {}

class SignedOut extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends AuthState {
  final String message;
  final int? statusCode;

  Error({required this.message, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [this.message];
}

class GoogleSignedIn extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FlaskSignedIn extends AuthState {
  final Token accessToken;

  FlaskSignedIn({
    required this.accessToken,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.accessToken];
}

class FlaskSignInFailed extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
