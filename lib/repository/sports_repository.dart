import 'package:dio/dio.dart';
import 'package:sweaterz_flutter/api_provider/sports_api_provider.dart';

class SportsRepository {
  final SportsApiProvider sportsApiProvider = SportsApiProvider();

  Future<Response> getAllSports() async =>
      await sportsApiProvider.getAllSports();

  Future<Response> addNewSports({required String name}) async =>
      await sportsApiProvider.addNewSports(name: name);
}
