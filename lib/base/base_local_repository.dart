import 'package:reddit_clone/manager/cache_manager.dart';

abstract class BaseLocalRepository {
  final CacheManager cacheManager;

  BaseLocalRepository({required this.cacheManager});
}
