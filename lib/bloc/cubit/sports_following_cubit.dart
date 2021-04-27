import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweaterz_flutter/bloc/state/sports_following_state.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/repository/sports_repository.dart';
import 'package:sweaterz_flutter/repository/user_repository.dart';

class SportsFollowingCubit extends Cubit<SportsFollowingState> {
  final SportsRepository sportsRepository;
  final UserRepository userRepository;

  SportsFollowingCubit(
      {required this.sportsRepository, required this.userRepository})
      : super(Empty());

  getSportsWithFollowingSports() async {
    try {
      emit(Loading());

      final allSportsResp = await this.sportsRepository.getAllSports();
      final sportsList =
          allSportsResp.data.map<Sports>((e) => Sports.fromJson(e)).toList();

      print(sportsList);

      final userFollowingSportsResp =
          await this.userRepository.getUserFollowingSports();
      List<Sports> userFollowingSportsList = userFollowingSportsResp.data
          .map<Sports>((e) => Sports.fromJson(e))
          .toList();

      emit(Loaded(
          sportsList: sportsList,
          userFollowingSportsList: userFollowingSportsList));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  followSport({required Sports sport}) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        final List<Sports> sportsList = [...parsedState.sportsList];

        final List<Sports> prevUserFollowingSportsList = [
          ...parsedState.userFollowingSportsList
        ];
        final List<Sports> newUserFollowingSportsList = [
          ...prevUserFollowingSportsList,
          sport,
        ];

        print(newUserFollowingSportsList);

        emit(Loaded(
            userFollowingSportsList: newUserFollowingSportsList,
            sportsList: sportsList));

        await this.userRepository.followSports(sport: sport);

        final userFollowingSportsResp =
            await this.userRepository.getUserFollowingSports();
        List<Sports> userFollowingSportsList = userFollowingSportsResp.data
            .map<Sports>((e) => Sports.fromJson(e))
            .toList();
        emit(Loaded(
            userFollowingSportsList: userFollowingSportsList,
            sportsList: sportsList));
        print(userFollowingSportsList);
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  unfollowSport({required Sports sport}) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        final List<Sports> sportsList = [...parsedState.sportsList];

        final List<Sports> prevUserFollowingSportsList = [
          ...parsedState.userFollowingSportsList
        ];
        prevUserFollowingSportsList
            .removeWhere((element) => element.id == sport.id);
        print(prevUserFollowingSportsList);
        final List<Sports> newUserFollowingSportsList = [
          ...prevUserFollowingSportsList
        ];

        emit(Loaded(
            userFollowingSportsList: newUserFollowingSportsList,
            sportsList: sportsList));

        await this.userRepository.unfollowSports(sport: sport);

        final userFollowingSportsResp =
            await this.userRepository.getUserFollowingSports();
        List<Sports> userFollowingSportsList = userFollowingSportsResp.data
            .map<Sports>((e) => Sports.fromJson(e))
            .toList();
        emit(Loaded(
            userFollowingSportsList: userFollowingSportsList,
            sportsList: sportsList));
        print(userFollowingSportsList);
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
