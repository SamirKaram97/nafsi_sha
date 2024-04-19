import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/models/article_models.dart';
import 'package:gp_nafsi/models/register_request_model.dart';
import 'package:gp_nafsi/models/video_response.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../models/user_model.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';

class ApiServices extends Interceptor {
  static late Dio _dio;
  static var headers = {
    'Content-Type': 'application/json',
    'Accept': 'json',
  };

  static final InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();

  static Future<void> initDio() async {
    _dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      headers: headers,
      connectTimeout: const Duration(seconds: Constants.connectTimeOut),
      receiveTimeout: const Duration(seconds: Constants.connectTimeOut),
      sendTimeout: const Duration(seconds: Constants.connectTimeOut),
    ));
    _dio.options.baseUrl = Constants.baseApiUrl;
  }

  static Future<UserModel> login(String email, String password) async {
    Map<String, dynamic> loginData = {"email": email, "password": password};

    var response = await _dio.post(Constants.loginEndPoint, data: loginData);
    print(response.data);

    //convert from json to user model and add token to the model to access it
    UserModel userModel = UserModel.fromJson(response.data["user"]);
    userModel.token = _extractToken(response.headers.value("set-cookie")!);
    return userModel;
  }

  static Future<bool> register(String email, String password) async {
    var response = await _dio.post(Constants.registerEndPoint,
        data: {"email": email, "password": password});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<ArticleResponse> getArticle() async {
    var response = await _dio.get(Constants.getArticlesEndPoint);
    ArticleResponse articleResponse = ArticleResponse.fromJson(response.data);
    return articleResponse;
  }

  static Future<List<VideoResponse>> getVideos(context) async {
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (token != null) {
      _dio.options.headers.addAll({"Cookie": "accessToken=$token"});
      var response = await _dio.get(Constants.getVideosEndPoint);
      List<VideoResponse> videos = [];
      response.data.forEach((e) {
        videos.add(VideoResponse.fromJson(e));
      });
      print(videos.length);
      return videos;
    }
    return [];
  }

  static String _extractToken(String cookie) {
    // Find the index of '=' and ';' characters
    int equalsIndex = cookie.indexOf('=');
    int semicolonIndex = cookie.indexOf(';');

    // Extract the substring between '=' and ';'
    String extractedValue = cookie.substring(equalsIndex + 1, semicolonIndex);

    return extractedValue;
  }

  static String getErrorMessage(error, context) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return S.of(context).connectionTimeOut;
        case DioExceptionType.sendTimeout:
          return S.of(context).connectionTimeOut;
        case DioExceptionType.receiveTimeout:
          return S.of(context).connectionTimeOut;
        case DioExceptionType.badCertificate:
          return S.of(context).someThingWentWrong;
        case DioExceptionType.badResponse:
          {
            if (error.response?.data["error"] is List) {
              return error.response?.data["error"][0]["message"];
            } else {
              return error.response?.data["error"] ??
                  error.response?.data["Error"];
            }
          }
        case DioExceptionType.cancel:
          return S.of(context).someThingWentWrong;
        case DioExceptionType.connectionError:
          return S.of(context).someThingWentWrong;
        case DioExceptionType.unknown:
          return S.of(context).someThingWentWrong;
      }
    } else {
      log(error.toString());
      return S.of(context).someThingWentWrongWillFix;
    }
  }

  /*

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          String token=BlocProvider.of<AppCubit>(context).token!;
          options.headers['Cookie'] = 'accessToken=$token';
          return handler.next(options);
        },
        onError: (DioError e, handler) async {
          print(e.response?.statusCode);
          if (e.response?.statusCode == 401) {
            // Update the request header with the new access token
            e.requestOptions.headers['Cookie'] = 'accessToken';

            // Repeat the request with the updated header
            return handler.resolve(await _dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
   */
}
