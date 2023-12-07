import 'dart:io';
import 'package:{{project_name.snakeCase()}}/database/session_manager.dart';
import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = SessionManager().token;

    options.headers.addAll({
      if (token.isNotEmpty) "Authorization": "Bearer $token",
      "app-os": Platform.operatingSystem,
    });
    return handler.next(options);
  }
}
