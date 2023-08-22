import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:reddit_clone/manager/splash_manager.dart';
import 'package:reddit_clone/widget/app_dependency_widget.dart';

import 'app.dart';

void main() async {
  var widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  await SplashManager.instance.init();
  runApp(const AppDependencyWidget(child: App()));
  FlutterNativeSplash.remove();
}
