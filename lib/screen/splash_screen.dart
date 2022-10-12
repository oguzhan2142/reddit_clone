import 'package:flutter/material.dart';

import '../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();

    super.initState();
  }

  void init() async {
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacementNamed(Routes.HOME),
    );
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
