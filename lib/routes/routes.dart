import 'package:flutter/material.dart';

import '../screen/home_screen.dart';

abstract class Routes {
  static const HOME = '/';

  static final Map<String, Widget Function(BuildContext context)> routes = {
    HOME: (context) => const HomeScreen(),
  };
}
