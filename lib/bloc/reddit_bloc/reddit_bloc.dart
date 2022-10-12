import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_use_case_generator/bloc_generator.dart';
import 'package:reddit_clone/manager/cache_manager.dart';
import 'package:reddit_clone/model/entry.dart';
import 'package:reddit_clone/model/response_failure.dart';
import 'package:reddit_clone/repository/local_reddit_repository.dart';
import 'package:reddit_clone/repository/remote_reddit_repository.dart';

part 'reddit_bloc.g.dart';

class RedditEvent {}

class RedditState {}

/* 
  This is my library. I created it for bloc code generation
  https://pub.dev/packages/bloc_use_case_generator

  We are defining events and states as use cases. build runner will handle rest.
  This makes more cleaner code and gives production speed. Especially in big projects
 */
@BlocAnnotation(
  baseEventType: RedditEvent,
  baseStateType: RedditState,
  failureModel: ResponseFailure,
  blocUseCases: [
    BlocUseCase(
      name: 'GetFlutterDev',
      output: {'entries': List<Entry>},
    )
  ],
)
class RedditBloc extends Bloc<RedditEvent, RedditState> {
  final RemoteRedditRepository remoteRedditRepository;
  final LocalRedditRepository localRedditRepository;

  RedditBloc({
    required this.remoteRedditRepository,
    required this.localRedditRepository,
  }) : super(InitialRedditState()) {
    on<GetFlutterDevEvent>(_getFlutterDev);
  }

  FutureOr<void> _getFlutterDev(GetFlutterDevEvent event, Emitter<RedditState> emit) async {
    emit(GetFlutterDevInProgressState());

    final eitherRemoteFailureOrModel = await remoteRedditRepository.getFlutterDev();

    final foldedRemoteFailureOrModel = eitherRemoteFailureOrModel.fold((l) => l, (r) => r);

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
      final eitherLocalFailureOrModel = await localRedditRepository.getFlutterDev();

      return emit(eitherLocalFailureOrModel.fold(
        (l) => GetFlutterDevFailedState(failure: l),
        (r) => GetFlutterDevCompletedState(entries: r),
      ));
    }
  }
}
