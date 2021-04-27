import 'package:dio/dio.dart';
import 'package:sweaterz_flutter/config.dart';
import 'package:sweaterz_flutter/utils/dio_logging_interceptor.dart';

class SportsApiProvider {
  final Dio _dio = Dio();

  SportsApiProvider() {
    _dio.options = dioOptions;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
    _dio.options.headers['requirestoken'] = true;
  }

  Future<Response> getAllSports() async {
    var response = await _dio.get('/sports');

    return response;
  }

  // 이 기능은 'admin' 권한을 가진 계정만 사용이 가능하게 백엔드 코드가 이루어짐.
  Future<Response> addNewSports({required String name}) async {
    var response = await _dio.post('/admin/user/sports', data: {'name': name});

    return response;
  }
}
