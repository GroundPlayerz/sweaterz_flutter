//const kIPAdress = '172.30.1.14:5000'; //월평집
// const kIpConfig = 'http://172.30.1.60:5000'; //봉명사무실5g
import 'package:dio/dio.dart';

const baseUrl = 'http://34.64.190.19:5000/api';

var dioOptions = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
