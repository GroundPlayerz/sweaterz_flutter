import 'package:dio/dio.dart';
import 'package:sweaterz_flutter/config.dart';
import 'package:sweaterz_flutter/model/sports/sports.dart';
import 'package:sweaterz_flutter/utils/dio_logging_interceptor.dart';

class UserApiProvider {
  final Dio _dio = Dio();

  UserApiProvider() {
    _dio.options = dioOptions;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
    _dio.options.headers['requirestoken'] = true;
  }

  Future<Response> getUserProfile() async {
    var response = await _dio.get('/user/profile');
    return response;
  }

  Future<Response> getUserFollowingSports() async {
    var response = await _dio.get('/user/sports');
    return response;
  }

  Future<Response> followSports({required Sports sport}) async {
    var response = await _dio.post('/user/sports/${sport.id}');

    return response;
  }

  Future<Response> unfollowSports({required Sports sport}) async {
    var response = await _dio.delete('/user/sports/${sport.id}');

    return response;
  }
}
