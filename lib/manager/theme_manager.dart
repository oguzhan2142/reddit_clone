import 'package:flutter/material.dart';
import 'package:reddit_clone/constants/colors.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_pref_const.dart';

final MaterialColor primarySwatch = MaterialColor(bourbon.value, {
  50: bourbon.withOpacity(.1),
  100: bourbon..withOpacity(.2),
  200: bourbon..withOpacity(.3),
  300: bourbon..withOpacity(.4),
  400: bourbon..withOpacity(.5),
  500: bourbon..withOpacity(.6),
  600: bourbon..withOpacity(.7),
  700: bourbon..withOpacity(.8),
  800: bourbon..withOpacity(.9),
  900: bourbon..withOpacity(1),
});

class ThemeManager {
  ThemeManager._();

  static final ThemeManager instance = ThemeManager._();

  late final SharedPreferences sharedPreferences;

  final _darkTheme = ThemeData.dark();
  final _lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    cardTheme: CardTheme(color: bourbon),
    scaffoldBackgroundColor: diSerria,
    appBarTheme: const AppBarTheme(color: bourbon),
  );

  ThemeData getInitialTheme() {
    if (isDark()) {
      return _darkTheme;
    }
    return _lightTheme;
  }

  ThemeData getTheme({required bool isDark}) {
    return isDark ? _darkTheme : _lightTheme;
  }

  /// run only once
  void init(SharedPreferences sharedPreferences) {
    this.sharedPreferences = sharedPreferences;
  }

  bool isDark() {
    bool? isDark = sharedPreferences.getBool(SharedPrefConst.THEME_TAG);

    return isDark ?? false;
  }

  Future<bool> saveThemeSetting({required bool isDark}) {
    return sharedPreferences.setBool(SharedPrefConst.THEME_TAG, isDark);
  }
}
