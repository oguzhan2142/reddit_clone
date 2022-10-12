// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

class InitialRedditState extends RedditState {}

class GetFlutterDevEvent extends RedditEvent {}

class GetFlutterDevInProgressState extends RedditState {}

class GetFlutterDevCompletedState extends RedditState {
  final List<Entry> entries;
  GetFlutterDevCompletedState({required this.entries});
}

class GetFlutterDevFailedState extends RedditState {
  final ResponseFailure failure;
  GetFlutterDevFailedState({required this.failure});
}
