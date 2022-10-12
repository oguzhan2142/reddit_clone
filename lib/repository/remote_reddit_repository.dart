import 'package:reddit_clone/base/base_remote_repository.dart';
import 'package:reddit_clone/model/response_failure.dart';
import 'package:reddit_clone/model/reddit_response.dart';
import 'package:dartz/dartz.dart';
import 'package:reddit_clone/repository/i_reddit_repository.dart';

class RemoteRedditRepository extends BaseRemoteRepository implements IRedditRepository {
  RemoteRedditRepository({required super.networkManager});

  @override
  Future<Either<ResponseFailure, RedditResponse>> getFlutterDev() {
    return networkManager.getAsSingle(
      path: '/r/flutterdev/top.json',
      queryParameters: {'count': 20},
      converter: (json) => RedditResponse.fromJson(json),
    );
  }
}
