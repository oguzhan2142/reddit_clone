import 'package:flutter/material.dart';
import 'package:reddit_clone/routes/routes.dart';

class App extends StatelessWidget {
  final _title = 'Reddit App';

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: Routes.SPLASH,
      routes: Routes.routes,
    );
  }
}
