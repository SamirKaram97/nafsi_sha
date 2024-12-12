import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'api_config.dart';

class NegativeValueException implements Exception {
  final String message;

  NegativeValueException(this.message);

  @override
  String toString() => message;
}

class APIService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: APIConfig.baseApiUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? deviceToken,
    String? token,
    bool? isAuth = true,
  }) async {
    if (!await InternetConnectionChecker.instance.hasConnection) {
      throw NegativeValueException('No Internet Connection');
    }
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'json',
    };
    var response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );
    return response;
  }

  static Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    bool? isAuth = true,
  }) async {
    if (!await InternetConnectionChecker.instance.hasConnection) {
      throw NegativeValueException('No Internet Connection');
    }

    _dio.options.headers = {
      'Content-Type': 'application/json',
    'Accept': 'json',};

    var response = await _dio.get(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );

      return response;
    }
  static String extractTokenFromCookie(String cookie) {
    // Find the index of '=' and ';' characters
    int equalsIndex = cookie.indexOf('=');
    int semicolonIndex = cookie.indexOf(';');

    // Extract the substring between '=' and ';'
    String extractedValue = cookie.substring(equalsIndex + 1, semicolonIndex);

    return extractedValue;
  }
  }




