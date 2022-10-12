import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reddit_clone/gen/assets.gen.dart';

import '../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    );

    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.of(context).pushReplacementNamed(Routes.HOME);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        Assets.lottie.splash.path,
        width: double.infinity,
        fit: BoxFit.cover,
        controller: _controller,
        onLoaded: (composition) {
          _controller.animateTo(1);
        },
      ),
    );
  }
}
