import 'dart:convert';

import 'package:reddit_clone/constants/shared_pref_const.dart';
import 'package:reddit_clone/model/reddit_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  late final SharedPreferences sharedPreferences;
  static final CacheManager instance = CacheManager._();
  CacheManager._();

  /// run only once
  void init(SharedPreferences sharedPreferences) {
    this.sharedPreferences = sharedPreferences;
  }

  Future<void> saveRedditResponse({
    required RedditResponse redditResponse,
  }) async {
    await sharedPreferences.setString(
      SharedPrefConst.REDDIT_RESPONSE_TAG,
      jsonEncode(redditResponse.toJson()),
    );
  }

  Future<RedditResponse?> getRedditResponse() async {
    String? jsonInDisk = sharedPreferences.getString(
      SharedPrefConst.REDDIT_RESPONSE_TAG,
    );

    if (jsonInDisk == null) {
      return null;
    }

    try {
      return RedditResponse.fromJson(jsonDecode(jsonInDisk));
    } catch (e) {
      // if there is a some bug with local data delete it
      await sharedPreferences.remove(SharedPrefConst.REDDIT_RESPONSE_TAG);
      return null;
    }
  }
}
