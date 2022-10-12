import 'package:reddit_clone/base/base_remote_repository.dart';
import 'package:reddit_clone/model/response_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:reddit_clone/repository/i_reddit_repository.dart';

import '../model/entry.dart';

class RemoteRedditRepository extends BaseRemoteRepository implements IRedditRepository {
  RemoteRedditRepository({required super.networkManager});

  @override
  Future<Either<ResponseFailure, List<Entry>>> getFlutterDev() {
    return networkManager.getAsList<Entry>(
      rootKeys: ['data', 'children'],
      path: '/r/flutterdev/top.json',
      queryParameters: {'count': 20},
      converter: (json) => Entry.fromJson(json),
    );
  }
}
