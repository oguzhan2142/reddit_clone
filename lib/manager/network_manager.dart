import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:reddit_clone/model/response_failure.dart';

class NetworkManager {
  late final Dio client;

  NetworkManager({
    required Dio dio,
    List<Interceptor>? interceptors,
  }) {
    client = dio;

    if (interceptors != null) {
      client.interceptors.addAll(interceptors);
    }
  }

  Future<Either<ResponseFailure, List<T>>> getAsList<T>({
    required String path,
    required T Function(Map<String, dynamic> json) converter,
    List<String>? rootKeys,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await client.get(
        path,
        queryParameters: queryParameters,
      );

      List dataList = [];

      var data = response.data;

      if (rootKeys != null) {
        var temp = data;
        for (var key in rootKeys) {
          temp = temp[key];
        }

        dataList = temp;
      } else {
        dataList = data;
      }

      final listOfT = dataList.map((e) => converter(e)).toList();

      return Right(listOfT);
    } catch (e) {
      print(e);
      return Left(ResponseFailure.unknown());
    }
  }
}
