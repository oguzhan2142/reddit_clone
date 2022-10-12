import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_pref_const.dart';

class ThemeManager {
  static final ThemeManager instance = ThemeManager._();
  ThemeManager._();

  late final SharedPreferences sharedPreferences;

  /// run only once
  void init(SharedPreferences sharedPreferences) {
    this.sharedPreferences = sharedPreferences;
  }

  Future<bool> saveThemeSetting({required bool isDark}) {
    return sharedPreferences.setBool(SharedPrefConst.THEME_TAG, isDark);
  }

  ThemeData getTheme({required bool isDark}) {
    return isDark ? darkTheme : lightTheme;
  }

  bool isDark() {
    bool? isDark = sharedPreferences.getBool(SharedPrefConst.THEME_TAG);

    return isDark ?? false;
  }

  final lightTheme = ThemeData();

  final darkTheme = ThemeData.dark();
}
