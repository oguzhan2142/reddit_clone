import 'package:flutter/material.dart';
import 'package:reddit_clone/gen/colors.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_pref_const.dart';

final MaterialColor primarySwatch = MaterialColor(ColorName.bourbon.value, {
  50: ColorName.bourbon.withOpacity(.1),
  100: ColorName.bourbon..withOpacity(.2),
  200: ColorName.bourbon..withOpacity(.3),
  300: ColorName.bourbon..withOpacity(.4),
  400: ColorName.bourbon..withOpacity(.5),
  500: ColorName.bourbon..withOpacity(.6),
  600: ColorName.bourbon..withOpacity(.7),
  700: ColorName.bourbon..withOpacity(.8),
  800: ColorName.bourbon..withOpacity(.9),
  900: ColorName.bourbon..withOpacity(1),
});

class ThemeManager {
  ThemeManager._();

  static final ThemeManager instance = ThemeManager._();

  late final SharedPreferences sharedPreferences;

  final _darkTheme = ThemeData.dark();
  final _lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: ColorName.offYellow,
    appBarTheme: const AppBarTheme(color: ColorName.bourbon),
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
