import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/models/article_models.dart';
import 'package:gp_nafsi/models/message_model.dart';
import 'package:gp_nafsi/models/register_request_model.dart';
import 'package:gp_nafsi/models/session_model.dart';
import 'package:gp_nafsi/models/sound_model.dart';
import 'package:gp_nafsi/models/video_response.dart';
import 'package:gp_nafsi/shared/cubit/app_cubit.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:upstash_redis/upstash_redis.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../layout/cubit/layout_cubit.dart';
import '../../../models/full_session_model.dart';
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
    userModel.token = extractToken(response.headers.value("set-cookie")!);
    return userModel;
  }



  static Future<UserModel> getUserData(context)async
  {
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (token != null) {
      print("token is $token");
      _dio.options.headers.addAll({"Cookie": "accessToken=$token"});
    }
    var response = await _dio.get(Constants.getMeEndPoint);
    UserModel userModel = UserModel.fromJson(response.data["user"]);
    userModel.token = AppCubit.get(context).token;
    print(userModel.age);
    return userModel;
  }

  static Future<void> register(String email, String password) async {
    var response = await _dio.post(Constants.registerEndPoint,
        data: {"email": email, "password": password});
    // return extractToken("accessToken=Bearer%20eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWRiNDEwYzE0YmM5NjYzYTA0ZTUxYTMiLCJpYXQiOjE3MTg4ODQwMjR9._0Z7uT4Mt4IwfMbCY8_ibHrWl2OsXNBarqUj-cUFI64; Path=/; HttpOnly");;
  }

  static Future<void> registerGoogleFacebook(String email, String uId) async {
    print(email);
    var response = await _dio.post(Constants.registerGoogleFaceEndPoint,
        data: {"email": email, "UID": uId});
    print(response.data);
    // return extractToken("accessToken=Bearer%20eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWRiNDEwYzE0YmM5NjYzYTA0ZTUxYTMiLCJpYXQiOjE3MTg4ODQwMjR9._0Z7uT4Mt4IwfMbCY8_ibHrWl2OsXNBarqUj-cUFI64; Path=/; HttpOnly");;
  }

  static Future<UserModel> loginGoogleFacebook(String email, String uId) async {

    var response = await _dio.post(Constants.loginGoogleFaceEndPoint,
        data: {"email": email, "UID": uId});
    print(response.data);
    UserModel userModel = UserModel.fromJson(response.data["user"]);
    userModel.token = extractToken(response.headers.value("set-cookie")!);
    return userModel;
  }


  static Future<UserModel> loginFaceId(String faceId) async {
    var response = await _dio.post(Constants.loginFaceIdEndPoint,
        data: {"facialid": faceId});
    print(response.data);
    UserModel userModel = UserModel.fromJson(response.data["user"]);
    userModel.token = extractToken(response.headers.value("set-cookie")!);
    return userModel;
  }



  static Future<UserModel> updateMe(Map<String,dynamic> values,context)async
  {
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (token != null) {
      print("token is $token");
      _dio.options.headers.addAll({"Cookie": "accessToken=$token"});
    }
    var response = await _dio.patch(Constants.updateMeEndPoint,
        data: values);
    print(response.data["data"]);
    print("from update");
    UserModel userModel = UserModel.fromJson(response.data["data"]);
    print(response.headers);
     userModel.token = AppCubit.get(context).token;
    return userModel;
  }

  static Future<UserModel> updateMeWithFaceId(String faceId,context)async
  {
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (token != null) {
      print("token is $token");
      _dio.options.headers.addAll({"Cookie": "accessToken=$token"});
    }
    var response = await _dio.patch(Constants.updateMeEndPoint,
        data: {"facialid":faceId});
    print(response.data["data"]);
    print("from update");
    UserModel userModel = UserModel.fromJson(response.data["data"]);
    print(response.headers);
     userModel.token = AppCubit.get(context).token;
    return userModel;
  }


  static Future<UserModel> getMe(context)async
  {
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (token != null) {
      _dio.options.headers.addAll({"Cookie": "accessToken=$token"});

    }
    var response = await _dio.get(Constants.getMeEndPoint);
    UserModel userModel = UserModel.fromJson(response.data["user"]);
    userModel.token = AppCubit.get(context).token;
    return userModel;
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
        VideoResponse videoResponse=VideoResponse.fromJson(e);
        if(videoResponse.videoId!=null) {
          videos.add(videoResponse.copyWith(imageLink: YoutubePlayer.getThumbnail(videoId: videoResponse.videoId!,quality: ThumbnailQuality.medium)));
        }
      });
      print(videos.length);
      return videos;
    }
    return [];
  }


  static Future<List<CustomUISessionModel>> getSessions(context)async
  {
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (token != null) {
      _dio.options.headers.addAll({"Cookie": "accessToken=$token"});
      var response = await _dio.get(Constants.getSessionsEndPoint);
      print(response.data);
      List<CustomUISessionModel> customUISessions = [];

      response.data.forEach((e) {
        CustomUISessionModel customUISessionModel=CustomUISessionModel.fromJson(e);
        customUISessions.add(customUISessionModel);
      });
      return customUISessions.reversed.toList();
    }
    return [];
  }

  static Future<String>createSession(SessionModel sessionModel,context)async
  {
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (true) {
      _dio.options.headers.addAll({"Cookie": "accessToken=$token"});
      var response = await _dio.post(Constants.createSessionEndPoint,data: sessionModel.toJson());
      print(response.data);
      return response.data["_id"];
    }
    return "";
  }

  static Future<void>updateSession(SessionModel sessionModel,String sId,context)async
  {
    print(Constants.updateSessionEndPoint+sId);
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (token != null) {
      _dio.options.headers.addAll({"Cookie": "accessToken=$token"});
      var response = await _dio.patch(Constants.updateSessionEndPoint+sId,data: sessionModel.toJson());
    }
  }


  static Future<List<SoundModel>>getSounds(List<String> keys)async
  {
    String q="";
    for (var element in keys) {
      q="$q, $element";
    }
    q="$q sounds";
    final dio = Dio();

    final response = await dio.get(
      'https://deezerdevs-deezer.p.rapidapi.com/search?q=$q',
      options: Options(
        headers: {
          'x-rapidapi-key': '1cb66bcd53msh53b53658a87ffdbp1ef5c6jsn0ac5e2124f70',
          'x-rapidapi-host': 'deezerdevs-deezer.p.rapidapi.com',
        },
      ),
    );
    List<SoundModel> sounds=[];
    response.data["data"].forEach((sound){
      sounds.add(SoundModel.fromJson(sound));
    });
    return sounds;
  }


  static Future<List<MessageModel>> getMessages(context)async
  {
    List<MessageModel> messages=[];
    String email= LayoutCubit.get(context).userModel!.email!;
    final redis = Redis(
      url: "https://trusted-shad-56124.upstash.io",
      token: "Ads8AAIncDExZWIyYjZjN2MyOTY0Nzg3ODYwODI2NDI0N2VmZDI0ZHAxNTYxMjQ",
    );
    int messagesLen = await redis.llen(email);
    if (messagesLen > 0) {
      List redisMessages=await redis.lrange(email, 0, messagesLen);
      redisMessages.forEach((element) {
        print(element);
        messages.add(MessageModel.fromJson(json.decode(element)));
      });
    }
    return messages;
  }

  static Future<MessageModel> sendMessage(context,String message)async
  {
   String email= LayoutCubit.get(context).userModel!.email!;
    Dio dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      headers: headers,
      baseUrl: "https://samirkaram97-flowise.hf.space/",
      connectTimeout: const Duration(seconds: Constants.connectTimeOut),
      receiveTimeout: const Duration(seconds: Constants.connectTimeOut),
      sendTimeout: const Duration(seconds: Constants.connectTimeOut),
    ));

    var response=await dio.post("api/v1/prediction/75ebad85-917a-4673-a7fd-51e4cb2c5158",data: {
      "question": message,
      "overrideConfig": {
        "sessionId": email
      }
    });
    return MessageModel(content: response.data["text"], type: "ai");
  }


  static String extractToken(String cookie) {
    // Find the index of '=' and ';' characters
    int equalsIndex = cookie.indexOf('=');
    int semicolonIndex = cookie.indexOf(';');

    // Extract the substring between '=' and ';'
    String extractedValue = cookie.substring(equalsIndex + 1, semicolonIndex);

    return extractedValue;
  }

  static String getErrorMessage(error, context) {
    log(error.runtimeType.toString());
    if (error is DioException) {
      print(error.type);
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return AppStrings.connectionTimeOut.tr();
        case DioExceptionType.sendTimeout:
          return AppStrings.connectionTimeOut.tr();
        case DioExceptionType.receiveTimeout:
          return AppStrings.connectionTimeOut.tr();
        case DioExceptionType.badCertificate:
          print("cer");
          return AppStrings.someThingWentWrong.tr();
        case DioExceptionType.badResponse:
          {
            print("badResponse");
            if (error.response?.data["error"] is List) {
              return error.response?.data["error"][0]["message"];
            } else {
              print(error.response?.data["error"]);
              return error.response?.data["error"] ?? error.response?.data["Error"];
            }
          }
        case DioExceptionType.cancel:
          return AppStrings.someThingWentWrong.tr();
        case DioExceptionType.connectionError:
          return AppStrings.someThingWentWrong.tr();
        case DioExceptionType.unknown:
          print("unKnown");
          return AppStrings.someThingWentWrong.tr();
      }
    } else {
      return "";
      return AppStrings.someThingWentWrongWillFix.tr();
    }
  }

  static Future<String> forgetPassword(String email)async
  {
    var response = await _dio.post(Constants.forgetPasswordEndPoint, data: {
      "email":email
    });
    if (response.statusCode == 200) {
      return response.data["message"];
    } else {
      return response.data["error"];
    }
  }

  static Future<String> updateUserPassword(String oldPassword,String newPassword,context)async
  {String? token = BlocProvider.of<AppCubit>(context).token;
  if (token != null) {
    _dio.options.headers.addAll({"Cookie": "accessToken=$token"});
    var response = await _dio.patch(Constants.changePasswordEndPoint,data: {"password":oldPassword,
      "newPassword":newPassword
    });
    return response.data["data"];
  }
  return "";
  }


  static Future<void> updateImage(File imageFile,context)async{
    String? token = BlocProvider.of<AppCubit>(context).token;
    if (token != null) {
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path,
      ),
    });

    final response = await _dio.patch(Constants.updateMeEndPoint, data: formData);
    print(response.data);
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
