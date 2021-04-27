import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/model/user/user.dart';

@immutable
abstract class SportsFollowingState extends Equatable {}

class Empty extends SportsFollowingState {
  @override
  List<Object> get props => [];
}

class Loading extends SportsFollowingState {
  @override
  List<Object> get props => [];
}

class Error extends SportsFollowingState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends SportsFollowingState {
  final List<Sports> sportsList;
  final List<Sports> userFollowingSportsList;

  Loaded({
    required this.sportsList,
    required this.userFollowingSportsList,
  });

  @override
  List<Object> get props => [
        this.sportsList,
        this.userFollowingSportsList,
      ];
}
