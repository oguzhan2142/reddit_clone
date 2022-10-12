import 'package:reddit_clone/model/response_failure.dart';
import 'package:reddit_clone/model/reddit_response.dart';
import 'package:dartz/dartz.dart';
import 'package:reddit_clone/repository/i_reddit_repository.dart';

class LocalRedditRepository implements IRedditRepository {
  @override
  Future<Either<ResponseFailure, RedditResponse>> getFlutterDev() {
    // TODO: implement getFlutterDev
    throw UnimplementedError();
  }
}
