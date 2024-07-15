import 'package:dio/dio.dart';
import 'package:event_app/datasource/remote/error_handler/data_source_extension.dart';
import 'package:flutter/material.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    debugPrint(error.toString());
    dynamic errorDescription = "";

    if (error is Exception) {
      try {
        if (error is DioException) {
          ErrorHandler.handle(error).failure;
          DioException errorn = error;
          print(errorn.type);
          errorDescription = errorn.message;
          // switch (error.type) {
          //   case DioErrorType.cancel:
          //     errorDescription = "Request to API server was cancelled";
          //     break;
          //   case DioErrorType.connectionTimeout:
          //     errorDescription = "Connection timeout with API server";
          //     break;
          //   case DioErrorType.unknown:
          //     errorDescription = "Connection to server failed due to internet connection";
          //     break;
          //   case DioErrorType.receiveTimeout:
          //     errorDescription = "Connection time out due to slow internet";
          //     break;
          //   case DioErrorType.badResponse:
          //     switch (error.response!.statusCode) {
          //       case 404:
          //       case 500:
          //       case 503:
          //         errorDescription = error.response!.statusMessage;
          //         break;
          //       default:
          //         ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
          //         if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
          //           errorDescription = errorResponse;
          //         } else {
          //           errorDescription = "Failed to load data - status code: ${error.response!.statusCode}";
          //         }
          //     }
          //     break;
          //   case DioErrorType.sendTimeout:
          //     errorDescription = "Send timeout with server";
          //     break;
          //   case DioErrorType.badCertificate:
          //     break;
          //   case DioErrorType.connectionError:
          //     break;
          // }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
