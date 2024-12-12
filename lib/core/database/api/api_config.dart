abstract class APIConfig {
  static const String baseApiUrl="https://g-p-1k1q.onrender.com/GP/";

  static String getStorageUrl({required String path}) => '$baseApiUrl/$path';

  static String getShareUrl({required String path}) => '$baseApiUrl/$path';

  static const String loginEndPoint="${baseApiUrl}auth/login";
  static const String getMeEndPoint="${baseApiUrl}user/getme";
  static const String updateMeEndPoint="${baseApiUrl}user/update-me";
  static const String registerEndPoint="${baseApiUrl}auth/register";
  static const String registerGoogleFaceEndPoint="${baseApiUrl}auth/registergoogle";
  static const String loginGoogleFaceEndPoint="${baseApiUrl}auth/logingoogle";
  static const String loginFaceIdEndPoint="${baseApiUrl}auth/loginfaceio";
  static const String getArticlesEndPoint="${baseApiUrl}articles/getall";
  static const String getVideosEndPoint="${baseApiUrl}videos/get-videos";
  static const String changePasswordEndPoint="${baseApiUrl}user/changepassword";
  static const String getSessionsEndPoint="${baseApiUrl}sessions/current";
  static const String createSessionEndPoint="${baseApiUrl}sessions/create";
  static const String updateSessionEndPoint="${baseApiUrl}sessions/";
  static const String forgetPasswordEndPoint="${baseApiUrl}user/forget-password";
}
