import 'package:reddit_clone/manager/cache_manager.dart';
import 'package:reddit_clone/manager/theme_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashManager {
  static final SplashManager instance = SplashManager._();
  SplashManager._();

  Future<void> init() async {
    var prefs = await SharedPreferences.getInstance();
    CacheManager.instance.init(prefs);
    ThemeManager.instance.init(prefs);

    // all splash related init goes here
  }
}
