import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweaterz_flutter/bloc/state/profile_screen_state.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/model/user/user.dart';
import 'package:sweaterz_flutter/repository/user_repository.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  final UserRepository repository;

  ProfileScreenCubit({required this.repository}) : super(Empty());

  getUserProfile() async {
    print('getUserProfile() called;');
    try {
      emit(Loading());

      final Response userProfileResp = await this.repository.getUserProfile();
      final Map<String, dynamic> decodedUserProfileResp = userProfileResp.data;

      final User user = User.fromJson(decodedUserProfileResp["user"]);
      print(user.toString());
      final List<User> followers = decodedUserProfileResp["followers"]
          .map<User>((e) => User.fromJson(e))
          .toList();
      print('followers.toString(): ' + followers.toString());
      final List<User> following = decodedUserProfileResp["following"]
          .map<User>((e) => User.fromJson(e))
          .toList();
      print('following.toString(): ' + following.toString());
      final List<Sports> followingSportsList =
          decodedUserProfileResp["following_sports"]
              .map<Sports>((e) => Sports.fromJson(e))
              .toList();
      print(followingSportsList.toString());
      emit(Loaded(
          user: user,
          followers: followers,
          following: following,
          followingSportsList: followingSportsList));
    } catch (e) {
      emit(Error(message: e.toString()));
      print('lsadjf;lkj;sladflk');
    }
  }
}
