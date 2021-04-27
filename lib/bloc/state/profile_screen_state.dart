import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/model/user/user.dart';

@immutable
abstract class ProfileScreenState extends Equatable {}

class Empty extends ProfileScreenState {
  @override
  List<Object> get props => [];
}

class Loading extends ProfileScreenState {
  @override
  List<Object> get props => [];
}

class Error extends ProfileScreenState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends ProfileScreenState {
  final User user;
  final List<Sports> followingSportsList;
  final List<User> followers;
  final List<User> following;

  Loaded({
    required this.user,
    required this.followingSportsList,
    required this.followers,
    required this.following,
  });

  @override
  List<Object> get props =>
      [this.user, this.followingSportsList, this.followers, this.following];
}
