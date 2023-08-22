import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/manager/theme_manager.dart';
import 'package:reddit_clone/routes/routes.dart';

import 'bloc/settings_bloc/settings_bloc.dart';

class App extends StatelessWidget {
  final _title = 'Reddit App';

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: BlocProvider.of<SettingsBloc>(context),
      builder: (context, state) {
        ThemeData theme = ThemeManager.instance.getInitialTheme();
        if (state is ChangeThemeCompletedState) {
          theme = state.theme;
        }
        return MaterialApp(
          title: _title,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.HOME,
          routes: Routes.routes,
          theme: theme,
        );
      },
    );
  }
}
