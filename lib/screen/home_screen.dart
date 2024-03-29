import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/bloc/reddit_bloc/reddit_bloc.dart';
import 'package:reddit_clone/bloc/settings_bloc/settings_bloc.dart';
import 'package:reddit_clone/manager/theme_manager.dart';
import 'package:reddit_clone/widget/empty_list_widget.dart';
import 'package:reddit_clone/widget/failed_widget.dart';

import '../widget/entry_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final RedditBloc redditBloc;
  late final SettingsBloc settingsBloc;

  @override
  void initState() {
    redditBloc = BlocProvider.of<RedditBloc>(context);
    settingsBloc = BlocProvider.of<SettingsBloc>(context);

    redditBloc.add(GetFlutterDevEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<SettingsBloc, SettingsState>(
              bloc: settingsBloc,
              builder: (context, state) {
                return IconButton(
                  onPressed: () => settingsBloc.add(ChangeThemeEvent(
                    isDark: !ThemeManager.instance.isDark(),
                  )),
                  icon: Icon(
                    Icons.dark_mode,
                    color: ThemeManager.instance.isDark()
                        ? Colors.amber
                        : Colors.black,
                  ),
                );
              },
            )
          ],
        ),
        body: BlocBuilder<RedditBloc, RedditState>(
          bloc: redditBloc,
          builder: (context, state) {
            if (state is GetFlutterDevInProgressState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetFlutterDevFailedState) {
              return Center(
                child: FailedWidget(
                  title: state.failure.message,
                  onRetry: () => redditBloc.add(GetFlutterDevEvent()),
                ),
              );
            }
            if (state is GetFlutterDevCompletedState) {
              if (state.entries.isEmpty) {
                return const EmptyListWidget(
                    title: 'Herhangi bir kayıt bulunamadı');
              }
              return RefreshIndicator(
                onRefresh: () async => redditBloc.add(GetFlutterDevEvent()),
                child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.entries.length,
                    itemBuilder: (context, index) {
                      var item = state.entries[index];

                      return EntryListItem(
                        entry: item,
                      );
                    }),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
