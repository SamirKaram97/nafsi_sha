import 'package:gp_nafsi/models/article_models.dart';
import 'package:gp_nafsi/models/video_response.dart';
import 'package:gp_nafsi/shared/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  static SharedPreferences? pref;

  static Future init()async
  {
    pref=await SharedPreferences.getInstance();
  }


  static String? getToken()
  {
    return pref!.getString(Constants.tokenSharedKey);
  }

  static Future<void> saveToken(String? token)async
  {
    if(token!=null) {
      await pref!.setString(Constants.tokenSharedKey, token);
    }
  }

  static Future<void> saveIsDataCompleted()async
  {
      await pref!.setBool(Constants.dataCompletedSharedKey, true);
  }
  static bool getIsDataCompleted()
  {
    return pref!.getBool(Constants.dataCompletedSharedKey)??false;
  }

  static Future<void> saveLanguage(String language)async
  {

      await pref!.setString(Constants.languageSharedToken, language);
  }

  static String getLanguage()
  {
    return pref!.getString(Constants.languageSharedToken)??"en";
  }

  static Future<void> saveFavouriteArticles(List<ArticleModel> articles)async
  {
    pref!.setString(Constants.favouriteArticlesSharedToken, ArticleModel.encode(articles));
  }

  static List<ArticleModel> getFavouriteArticles()
  {
    String articles=  pref!.getString(Constants.favouriteArticlesSharedToken)??"[]";
    return ArticleModel.decode(articles);
  }


  static Future<void> saveFavouriteVideos(List<VideoResponse> videos)async
  {
    pref!.setString(Constants.favouriteVideosSharedToken, VideoResponse.encode(videos));
  }

  static List<VideoResponse> getFavouriteVideos()
  {
    String videos=  pref!.getString(Constants.favouriteVideosSharedToken)??"[]";
    return VideoResponse.decode(videos);
  }


  static Future<void> cacheVideos(List<VideoResponse> videos)
  async {
    pref!.setString(Constants.cacheVideosSharedToken, VideoResponse.encode(videos));
  }

  static List<VideoResponse> getCacheVideos()
  {
    String videos=  pref!.getString(Constants.cacheVideosSharedToken)??"[]";
    return VideoResponse.decode(videos);
  }






















/*
  static Future<bool> isUsingFingerAuth()async
  {
    return pref!.getBool("finger")??false;
  }



  static Future<void> saveUsingFingerAuth(bool value)async
  {
    pref!.setBool("finger", value);
  }

  static Future<void> saveAppLastClose(String date)async
  {
    pref!.setString("appLastClose", date);
  }

  static Future<void> allowedDurationBeforeFingerPrint(int min)async
  {
    pref!.setInt("allowedDuration", min);
  }

  static Future<int> getAllowedDurationBeforeFingerPrint()async
  {
    return await pref!.getInt("allowedDuration")??0;
  }

  static Future<DateTime> getAppLastClose()async
  {
    String? date=await pref!.getString("appLastClose");
    if(date!=null)
    return DateTime.parse(date);
    return DateTime.now();
  }

  // static Future<void> saveAppSessions(List<SessionModel> sessions)async
  // {
  //   pref!.setString("sessions", SessionModel.encode(sessions));
  // }
  //
  // static List<SessionModel> getAppSessions()
  // {
  //   String sessions=  pref!.getString("sessions")??"[]";
  //   return SessionModel.decode(sessions);
  // }


  static String? getApiToken()
  {
    return pref!.getString("apiToken");
  }

  static Future<void> saveApiToken(String token)async
  {
    await pref!.setString("apiToken", token);
  }
*/

  static Future<void>removeShared()async
  {
    await pref!.clear();

  }


  static Future<bool> removeKey(String key)
  {
    return pref!.remove(key);
  }

}