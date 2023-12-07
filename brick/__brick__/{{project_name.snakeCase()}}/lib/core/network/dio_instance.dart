
import 'package:{{project_name.snakeCase()}}/core/env_variables.dart';
import 'package:{{project_name.snakeCase()}}/core/network/request_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioInstance {
  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        baseUrl: EnvVars.baseUrl,
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
      ));
      _dio!.interceptors.add(RequestInterceptor());
      if (kDebugMode) {
        _dio!.interceptors.add(
          PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              error: true,
              compact: true,
              maxWidth: 90),
        );
      }
    }
    return _dio!;
  }
}
