import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_nafsi/core/database/api/api_config.dart';
import 'package:gp_nafsi/core/database/api/api_service.dart';
import 'package:gp_nafsi/features/auth/data/models/user_data_model.dart';
import 'package:gp_nafsi/shared/network/remote/firebase_services.dart';

abstract class AuthRemoteDataSource {
  Future<UserDataModel> login(String email, String password);
  Future<void> register(String email, String password);

  Future<UserDataModel> loginGoogle();
  Future<void> registerGoogle();

  Future<UserDataModel> loginFacebook();
  Future<void> registerFacebook();

  Future<UserDataModel> loginFaceId(String faceId);
}





class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseServices firebaseServices;

  AuthRemoteDataSourceImpl({required this.firebaseServices});

  @override
  Future<UserDataModel> login(String email, String password) async {
    var response = await APIService.post(endpoint: APIConfig.loginEndPoint,
        body: {"email": email, "password": password});
    //convert from json to user model and add token to the model to access it
    UserDataModel userModel = UserDataModel.fromJson(response.data["user"])..copyWith(token: APIService.extractTokenFromCookie(response.headers.value("set-cookie")!));
    return userModel;
  }

  @override
  Future<UserDataModel> loginGoogle()async {
      UserCredential? userCredential = await FirebaseServices.signInWithGoogle();
      if (userCredential != null) {
        var response = await APIService.post(
            endpoint: APIConfig.loginGoogleFaceEndPoint,
            body: {
              "email": userCredential.user!.email,
              "UID": userCredential.user!.uid
            });
        UserDataModel userModel = UserDataModel.fromJson(response.data["user"])..copyWith(token: APIService.extractTokenFromCookie(response.headers.value("set-cookie")!));
        return userModel;
      }
      throw Exception("Canceled");
  }

  @override
  Future<UserDataModel> loginFacebook()async  {
    UserCredential? userCredential =
        await FirebaseServices.signInWithFacebook();
    if (userCredential != null) {
      var response = await APIService.post(
          endpoint: APIConfig.loginGoogleFaceEndPoint,
          body: {
            "email": userCredential.user!.email,
            "UID": userCredential.user!.uid
          });
      UserDataModel userModel = UserDataModel.fromJson(response.data["user"])..copyWith(token: APIService.extractTokenFromCookie(response.headers.value("set-cookie")!));
      return userModel;
    }
    throw Exception("Canceled");
  }

  @override
  Future<UserDataModel> loginFaceId(String faceId) async {
    var response = await APIService.get(endpoint: APIConfig.loginFaceIdEndPoint,
        body: {"facialid": faceId});

    UserDataModel userModel = UserDataModel.fromJson(response.data["user"])..copyWith(token: APIService.extractTokenFromCookie(response.headers.value("set-cookie")!));
    return userModel;
  }

  @override
  Future<void> register(String email, String password) async {
     await APIService.post(endpoint: APIConfig.registerEndPoint,
        body: {"email": email, "password": password});
  }

  @override
  Future<void> registerFacebook() async {
    UserCredential? userCredential =
    await FirebaseServices.signInWithFacebook();
    if (userCredential != null) {
      await APIService.post(
          endpoint: APIConfig.registerGoogleFaceEndPoint,
          body: {
            "email": userCredential.user!.email,
            "UID": userCredential.user!.uid
          });
    }
    throw Exception("Canceled");
  }

  @override
  Future<void> registerGoogle() async {
    UserCredential? userCredential =
    await FirebaseServices.signInWithFacebook();
    if (userCredential != null) {
       await APIService.post(
          endpoint: APIConfig.registerGoogleFaceEndPoint,
          body: {
            "email": userCredential.user!.email,
            "UID": userCredential.user!.uid
          });
    }
    throw Exception("Canceled");
  }
}






