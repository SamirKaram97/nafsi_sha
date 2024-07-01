class Constants
{
  static const String baseApiUrl="https://g-p-1k1q.onrender.com/GP/";
  static const String loginEndPoint="auth/login";
  static const String getMeEndPoint="user/getme";
  static const String updateMeEndPoint="user/update-me";
  static const String registerEndPoint="auth/register";
  static const String registerGoogleFaceEndPoint="auth/registergoogle";
  static const String loginGoogleFaceEndPoint="auth/logingoogle";
  static const String loginFaceIdEndPoint="auth/loginfaceio";
  static const String getArticlesEndPoint="articles/getall";
  static const String getVideosEndPoint="videos/get-videos";
  static const String changePasswordEndPoint="user/changepassword";
  static const String getSessionsEndPoint="sessions/current";
  static const String createSessionEndPoint="sessions/create";
  static const String updateSessionEndPoint="sessions/";
  static const String forgetPasswordEndPoint="user/forget-password";
  static const int connectTimeOut=180;


  static const String tokenSharedKey="token";
  static const String dataCompletedSharedKey="token";
  static const String languageSharedToken="language";
  static const String favouriteArticlesSharedToken="favouriteArticles";
  static const String favouriteVideosSharedToken="favouriteVideos";
  static const String favouriteTestsSharedToken="favouriteTests";
  static const String cacheVideosSharedToken="cacheVideos";
}