import 'package:reddit_clone/base/base_local_repository.dart';
import 'package:reddit_clone/enum/failure_reason.dart';
import 'package:reddit_clone/model/response_failure.dart';
import 'package:reddit_clone/model/entry.dart';
import 'package:dartz/dartz.dart';
import 'package:reddit_clone/repository/i_reddit_repository.dart';

class LocalRedditRepository extends BaseLocalRepository implements IRedditRepository {
  LocalRedditRepository({required super.cacheManager});

  @override
  Future<Either<ResponseFailure, List<Entry>>> getFlutterDev() async {
    final localData = await cacheManager.getRedditResponses();

    if (localData == null) {
      return Left(ResponseFailure(
        message: '',
        failureReason: FailureReason.NO_LOCAL_DATA,
      ));
    }

    return Right(localData);
  }
}
