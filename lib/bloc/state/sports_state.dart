import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/model/user/user.dart';

@immutable
abstract class SportsState extends Equatable {}

class Empty extends SportsState {
  @override
  List<Object> get props => [];
}

class Loading extends SportsState {
  @override
  List<Object> get props => [];
}

class Error extends SportsState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}

class Loaded extends SportsState {
  final List<Sports> sportsList;

  Loaded({
    required this.sportsList,
  });

  @override
  List<Object> get props => [this.sportsList];
}
