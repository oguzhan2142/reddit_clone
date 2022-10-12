import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/bloc/reddit_bloc/reddit_bloc.dart';
import 'package:reddit_clone/widget/empty_list_widget.dart';
import 'package:reddit_clone/widget/failed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final RedditBloc redditBloc;

  @override
  void initState() {
    redditBloc = BlocProvider.of<RedditBloc>(context);
    redditBloc.add(GetFlutterDevEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<RedditBloc, RedditState>(
          bloc: redditBloc,
          builder: (context, state) {
            print(state);
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
                return const EmptyListWidget(title: 'Herhangi bir kayıt bulunamadı');
              }
              return ListView.builder(
                  itemCount: state.entries.length,
                  itemBuilder: (context, index) {
                    var item = state.entries[index];
                    return ListTile(
                      title: Text(item.data?.title ?? ''),
                    );
                  });
            }
            return const SizedBox();
          },
        ));
  }
}
