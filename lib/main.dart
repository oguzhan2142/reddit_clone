import 'package:flutter/material.dart';
import 'package:reddit_clone/widget/app_dependency_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'manager/cache_manager.dart';
import 'manager/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  CacheManager.instance.init(prefs);
  ThemeManager.instance.init(prefs);
  runApp(const AppDependencyWidget(child: App()));
}
