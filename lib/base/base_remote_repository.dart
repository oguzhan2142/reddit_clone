import 'package:reddit_clone/manager/network_manager.dart';

abstract class BaseRemoteRepository {
  late final NetworkManager networkManager;

  BaseRemoteRepository({
    required this.networkManager,
  });
}
