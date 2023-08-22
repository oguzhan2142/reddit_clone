import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/bloc/reddit_bloc/reddit_bloc.dart';
import 'package:reddit_clone/constants/url_const.dart';
import 'package:reddit_clone/manager/cache_manager.dart';
import 'package:reddit_clone/manager/network_manager.dart';
import 'package:reddit_clone/repository/local_reddit_repository.dart';
import 'package:reddit_clone/repository/remote_reddit_repository.dart';

import '../bloc/settings_bloc/settings_bloc.dart';

class AppDependencyWidget extends StatelessWidget {
  final Widget child;
  const AppDependencyWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final redditNetworkManager = NetworkManager(
      dio: Dio(BaseOptions(baseUrl: UrlConst.baseRedditUrl)),
    );

    final remoteRedditRepository = RemoteRedditRepository(
      networkManager: redditNetworkManager,
    );

    final localRedditRepository = LocalRedditRepository(
      cacheManager: CacheManager.instance,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),
        BlocProvider(
          create: (context) => RedditBloc(
            remoteRedditRepository,
            localRedditRepository,
          ),
        )
      ],
      child: child,
    );
  }
}
