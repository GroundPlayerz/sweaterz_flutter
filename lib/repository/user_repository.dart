import 'package:dio/dio.dart';
import 'package:sweaterz_flutter/api_provider/user_api_provider.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/model/user/user.dart';
import 'package:sweaterz_flutter/config.dart';

class UserRepository {
  final UserApiProvider userApiProvider = UserApiProvider();

  Future<Response> getUserProfile() async =>
      await userApiProvider.getUserProfile();

  Future<Response> getUserFollowingSports() async =>
      await userApiProvider.getUserFollowingSports();

  Future<Response> followSports({required Sports sport}) async =>
      await userApiProvider.followSports(sport: sport);

  Future<Response> unfollowSports({required Sports sport}) async =>
      await userApiProvider.unfollowSports(sport: sport);
}
