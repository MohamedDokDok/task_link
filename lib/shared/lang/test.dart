import 'package:flutter/material.dart';

import 'lang_manager.dart';

class AppPreferences {
  /*Future<void> changeAppLanguage() async {
    //String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
   *//*   // set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());*//*
    } else {
      // set arabic
      *//*_sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());*//*
    }
  }*/

  Future<Locale> getLocal() async {

    if (LanguageType.ARABIC.getValue() == ARABIC) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }
}