import 'dart:developer';

import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required String errMessage}) : super(errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    log(dioException.type.toString());
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request to server was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(
          errMessage: "Connection to server failed due to internet connection",
        );
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection timeout with server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errMessage: "Receive timeout in connection with server",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errMessage: "Send timeout in connection with server",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errMessage: "Bad certificate in connection with server",
        );
      case DioExceptionType.badResponse:
        {
          log(dioException.response.toString());
          try {
            return ServerFailure._fromResponse(dioException.response);
          } catch (e) {
            return ServerFailure(
                errMessage:
                    "Oops, Unexpected Error Occurred, Please try again later");
          }
        }
      default:
        return ServerFailure(
          errMessage: "Oops, Unexpected Error Occurred, Please try again later",
        );
    }
  }

  factory ServerFailure._fromResponse(Response? response) {
    log((response?.data).toString());
    final statusCode = response?.statusCode!;
    var responseData = response?.data!;
    String errorMessage =
        'Oops, Unexpected Error Occurred, Please try again later';
    if (response == null) {
      return ServerFailure(errMessage: errorMessage);
    } else {
      if (response.data["error"] is List) {
        return response.data["error"][0]["message"];
      } else {
        return response.data["error"] ?? response.data["Error"];
      }
      if (responseData is String) {
        return ServerFailure(errMessage: responseData);
      } else if (responseData.containsKey('errors')) {
        if (responseData['errors'] is Map) {
          final errors = responseData['errors'];
          if (errors[errors.keys.first] is String) {
            errorMessage = errors[errors.keys.first];
          } else if (errors[errors.keys.first] is List) {
            errorMessage = errors[errors.keys.first][0];
          }
        } else if (responseData['errors'] is String) {
          errorMessage = responseData['errors'];
        }
        return ServerFailure(errMessage: errorMessage);
      }
      else if (responseData.containsKey('message')) {
        return ServerFailure(errMessage: responseData['message']);
      }
      else if (responseData.containsKey('error')) {
        return ServerFailure(errMessage: responseData['error']['message']);
      }  else {
        switch (statusCode) {
          case 404:
            errorMessage = 'Your request was not found, Please try again later';
            break;
          case 500:
            errorMessage = 'Internal server error, please try again later';
            break;
          case 503:
            errorMessage = 'Service Unavailable, please try again later';
            break;
          case 400:
            errorMessage = 'Bad request, please try again later';
            break;
          case 401:
            errorMessage = 'Unauthorized, please try again later';
            break;
          case 402:
            errorMessage = 'Payment required, please try again later';
            break;
          case 403:
            errorMessage = errorMessage.isNotEmpty
                ? errorMessage
                : "An error occurred while processing your request";
            break;
          default:
            break;
        }
      }
      if (errorMessage.isEmpty) {
        errorMessage = 'Oops, Unknown Error Occurred, Please try again later';
      }
      return ServerFailure(errMessage: errorMessage);
    }
  }
}
