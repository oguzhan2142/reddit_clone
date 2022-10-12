import 'package:flutter/material.dart';
import 'package:reddit_clone/screen/splash_screen.dart';

import '../screen/home_screen.dart';

abstract class Routes {
  static const SPLASH = '/';
  static const HOME = '/home';

  static final Map<String, Widget Function(BuildContext context)> routes = {
    SPLASH: (context) => const SplashScreen(),
    HOME: (context) => const HomeScreen(),
  };
}
