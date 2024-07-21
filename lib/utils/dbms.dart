

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sundar_gutka/data/model.dart';

class SharedPrefsHelper {

  final FirebaseAnalytics fAnalytics = FirebaseAnalytics.instance;

  static const String keyIsPageView = 'isPageView';
  static const String keyFontSize = 'fontSize';
  static const String keyFontWeight = 'fontWeight';
  static const String keyLanguage = 'language';

  Future<void> saveSettings(SettingModel settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsPageView, settings.isPageView);
    await prefs.setInt(keyFontSize, settings.fontSize);
    await prefs.setInt(keyFontWeight, settings.fontWeight);
    await prefs.setString(keyLanguage, settings.language.toString());

    // Firebase Analytics
    fAnalytics.setAnalyticsCollectionEnabled(true);

 await fAnalytics.logEvent(
            name:'user_settings',          
            parameters: {
                  "fontSize" : settings.fontSize.toString(),
                  "fontWeight" : settings.fontWeight.toString(),
                  "isPageView":settings.isPageView.toString(),
                  "language": settings.language.toString()
            } 
            );
  }

  Future<SettingModel> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final isPageView = prefs.getBool(keyIsPageView) ?? true;
    final fontSize = prefs.getInt(keyFontSize) ?? 26;
    final fontWeight = prefs.getInt(keyFontWeight) ?? FontWeight.normal.value ~/ 100;
    final languageStr = prefs.getString(keyLanguage) ?? Language.punjabi.toString();
    final language = Language.values.firstWhere((e) => e.toString() == languageStr);

    return SettingModel(
      fontSize: fontSize,
      fontWeight: fontWeight,
      isPageView: isPageView,
      language: language,
    );
  }
}
