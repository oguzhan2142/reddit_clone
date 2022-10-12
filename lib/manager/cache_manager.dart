import 'dart:convert';

import 'package:reddit_clone/constants/shared_pref_const.dart';
import 'package:reddit_clone/model/entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  late final SharedPreferences sharedPreferences;
  static final CacheManager instance = CacheManager._();
  CacheManager._();

  /// run only once
  void init(SharedPreferences sharedPreferences) {
    this.sharedPreferences = sharedPreferences;
  }

  Future<void> saveRedditResponses({
    required List<Entry> entries,
  }) async {
    await sharedPreferences.setStringList(
      SharedPrefConst.ENTRIES_TAG,
      entries.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  Future<List<Entry>?> getRedditResponses() async {
    List<String>? jsonInDisk = sharedPreferences.getStringList(
      SharedPrefConst.ENTRIES_TAG,
    );

    if (jsonInDisk == null) {
      return null;
    }

    try {
      return jsonInDisk.map((e) => Entry.fromJson(jsonDecode(e))).toList();
    } catch (e) {
      // if there is a some bug with local data delete it
      await sharedPreferences.remove(SharedPrefConst.ENTRIES_TAG);
      return null;
    }
  }
}
