import 'dart:io';

import 'package:{{project_name.snakeCase()}}/core/state/ui_state.dart';
import 'package:dio/dio.dart';

class ApiError {
  int errorType = 0;
  String errorDescription = "";
  int errorCode = 0;
  ApiErrorModel? apiErrorModel;

  ApiError(Object error, [String? fallBackErrorMessage]) {
    if (error is DioException) {
      var dioError = error;
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection";
          break;
        case DioExceptionType.badResponse:
          try {
            apiErrorModel =
                ApiErrorModel.fromJson(dioError.response?.data);
            errorDescription = apiErrorModel?.error?.userMessage ??
                (apiErrorModel?.message ?? "Oops an error has occurred");
            var code = apiErrorModel?.code;
            if (code != null) errorCode = code;
            if (dioError.response?.statusCode == 403) {
              errorCode = 403;
            }
          } catch (error) {
            errorDescription = "App Error. Bad response";
          }
          break;
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            errorDescription = "No Internet connection";
          } else {
            errorDescription = "Unable to connect";
          }
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Connection failed due to internet connection";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Unable to connect";
          break;
        case DioExceptionType.cancel:
          errorDescription = "Unable to connect";
      }
    } else {
      errorDescription = castOrNull<ApiError>(error)?.errorDescription ??
          (error is String
              ? error
              : fallBackErrorMessage ?? "An unexpected error occurred");
    }
  }

  @override
  String toString() => errorDescription;
}

class ApiErrorModel {

  late int code;
  Error? error;
  late String message;
  bool success;

  ApiErrorModel({
    required this.code,
    this.error,
    required this.message,
    this.success = false,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
    code: json["code"],
    error: json["error"] != null ? Error.fromJson(json["error"]) : null,
    message: json["message"],
  );
}


class Error {
  String? devMessage;
  String? possibleSolution;
  String? exceptionError;
  List<dynamic>? validationError;
  late String userMessage;
  int? errorCode;
  int? statusCode;

  Error({
    this.devMessage,
    this.possibleSolution,
    this.exceptionError,
    this.validationError,
    this.userMessage = "Oops an Error occurred please try again later",
    this.errorCode,
    this.statusCode,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    devMessage: json["devMessage"],
    possibleSolution: json["possibleSolution"],
    exceptionError: json["exceptionError"],
    // validationError: List<dynamic>.from(json["validationError"].map((x) => x)),
    userMessage: json["userMessage"],
    errorCode: json["errorCode"],
    statusCode: json["statusCode"],
  );
}
