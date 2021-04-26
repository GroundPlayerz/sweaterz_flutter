import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/model/user/user.dart';

@immutable
abstract class UserState extends Equatable {}

class Empty extends UserState {
  @override
  List<Object> get props => [];
}

class Loading extends UserState {
  @override
  List<Object> get props => [];
}

class Error extends UserState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends UserState {
  final List<User> todos;

  Loaded({
    required this.todos,
  });

  @override
  List<Object> get props => [this.todos];
}
