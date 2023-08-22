import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_clone/manager/cache_manager.dart';

import 'package:reddit_clone/model/entry.dart';
import 'package:reddit_clone/model/response_failure.dart';
import 'package:reddit_clone/repository/local_reddit_repository.dart';
import 'package:reddit_clone/repository/remote_reddit_repository.dart';

part 'reddit_event.dart';
part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  final RemoteRedditRepository remoteRedditRepository;
  final LocalRedditRepository localRedditRepository;
  RedditBloc(
    this.remoteRedditRepository,
    this.localRedditRepository,
  ) : super(RedditInitial()) {
    on<GetFlutterDevEvent>(_getFlutterDev);
  }

  FutureOr<void> _getFlutterDev(
      GetFlutterDevEvent event, Emitter<RedditState> emit) async {
    emit(GetFlutterDevInProgressState());

    final eitherRemoteFailureOrModel =
        await remoteRedditRepository.getFlutterDev();

    final foldedRemoteFailureOrModel =
        eitherRemoteFailureOrModel.fold((l) => l, (r) => r);

    if (foldedRemoteFailureOrModel is List<Entry>) {
      // if we have got any data then save it local
      CacheManager.instance.saveRedditResponses(
        entries: foldedRemoteFailureOrModel,
      );

      return emit(GetFlutterDevCompletedState(
        entries: foldedRemoteFailureOrModel,
      ));
    }

    // if we don't have fresh data from api. Check cached data
    if (foldedRemoteFailureOrModel is ResponseFailure) {
      final eitherLocalFailureOrModel =
          await localRedditRepository.getFlutterDev();

      return emit(eitherLocalFailureOrModel.fold(
        (l) => GetFlutterDevFailedState(failure: l),
        (r) => GetFlutterDevCompletedState(entries: r),
      ));
    }
  }
}
