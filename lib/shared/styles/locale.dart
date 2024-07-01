

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../network/local/shared_helper.dart';

class LocaleHelper
{
  static Locale arabicLocal=const Locale('ar','SA');
  static Locale englishLocal=const Locale('en','US');

  static Locale getLocale()
  {
    String? language=SharedHelper.getLanguage();
    if(language=="ar") {
      return  LocaleHelper.arabicLocal;
    }
    return LocaleHelper.englishLocal;
  }

  static void changeLanguageToArabic(context)async
  {
    await SharedHelper.saveLanguage("ar");
    Phoenix.rebirth(context);
  }

  static void changeLanguageToEnglish(context)async
  {
    await SharedHelper.saveLanguage("en");
    Phoenix.rebirth(context);
  }

  static void toggleLanguage(context)
  {
    String? language=SharedHelper.getLanguage();
    if(language=="ar")
      {
        changeLanguageToEnglish(context);
      }
    else{
      changeLanguageToArabic(context);
    }
  }
}