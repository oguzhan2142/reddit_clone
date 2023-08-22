part of 'reddit_bloc.dart';

class RedditState extends Equatable {
  const RedditState();

  @override
  List<Object> get props => [];
}

class RedditInitial extends RedditState {}

class GetFlutterDevInProgressState extends RedditState {}

class GetFlutterDevCompletedState extends RedditState {
  final List<Entry> entries;
  const GetFlutterDevCompletedState({required this.entries});
}

class GetFlutterDevFailedState extends RedditState {
  final ResponseFailure failure;
  const GetFlutterDevFailedState({required this.failure});
}
