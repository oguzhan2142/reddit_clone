import 'package:dartz/dartz.dart';
import 'package:reddit_clone/base/base_repository.dart';
import 'package:reddit_clone/model/response_failure.dart';

import '../model/entry.dart';

abstract class IRedditRepository extends BaseRepository {
  Future<Either<ResponseFailure, List<Entry>>> getFlutterDev();
}
