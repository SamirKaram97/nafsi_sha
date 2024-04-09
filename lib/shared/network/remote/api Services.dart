import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gp_nafsi/models/register_request_model.dart';

import '../../../models/user_model.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';

class ApiServices
{
  static late Dio _dio;
  static var headers = {
    'Content-Type': 'application/json',
    'Accept':'json',
  };

  static Future<void> initDio() async {
    _dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      headers: headers,
      connectTimeout:  const Duration(seconds: Constants.connectTimeOut),
      receiveTimeout: const Duration(seconds: Constants.connectTimeOut),
      sendTimeout: const Duration(seconds: Constants.connectTimeOut),
    ));
    _dio.options.baseUrl=Constants.baseApiUrl;
  }

  static Future<UserModel> login(String email,String password)async
  {
    Map<String,dynamic> loginData={
      "email":email,
      "password":password
    };
    var response = await _dio.post(Constants.loginEndPoint,data: loginData);

    //convert from json to user model and add token to the model to access it
    UserModel userModel= UserModel.fromJson(response.data["data"]);
    userModel.token=_extractToken(response.headers.value("set-cookie")!);
    return userModel;
  }





  static Future<bool> register(String email,String password)async
  {

    var response = await _dio.post(Constants.registerEndPoint,data: {
      "email":email,
      "password":password
    });
    if(response.statusCode==200)
      {
        return true;
      }
    else
      {
        return false;
      }
  }


  static String _extractToken(String cookie)
  {

      // Find the index of '=' and ';' characters
      int equalsIndex = cookie.indexOf('=');
      int semicolonIndex = cookie.indexOf(';');

      // Extract the substring between '=' and ';'
      String extractedValue = cookie.substring(equalsIndex + 1, semicolonIndex);

      return  extractedValue;

  }
  static String getErrorMessage(error)
  {
    if(error is DioException)
    {
      switch(error.type) {
        case DioExceptionType.connectionTimeout:
          return AppStrings.connectionTimeOut;
        case DioExceptionType.sendTimeout:
          return AppStrings.connectionTimeOut;
        case DioExceptionType.receiveTimeout:
          return AppStrings.connectionTimeOut;
        case DioExceptionType.badCertificate:
          return AppStrings.someThingWentWrong;
        case DioExceptionType.badResponse:
          {
            if(error.response?.data["error"] is List)
            {
              return error.response?.data["error"][0]["message"];
            }
            else
            {
              return error.response?.data["error"]??error.response?.data["Error"];
            }
          }
        case DioExceptionType.cancel:
          return AppStrings.someThingWentWrong;
        case DioExceptionType.connectionError:
          return AppStrings.someThingWentWrong;
        case DioExceptionType.unknown:
          return AppStrings.someThingWentWrong;
      }

    }
    else
    {
      log(error.toString());
      return AppStrings.someThingWentWrongWillFix;

    }
  }
}