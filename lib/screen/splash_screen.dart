import 'package:flutter/material.dart';
import 'package:reddit_clone/manager/cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  void init() async {
    var prefs = await SharedPreferences.getInstance();
    CacheManager.instance.init(prefs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('splash_screen'),
      ),
    );
  }
}
