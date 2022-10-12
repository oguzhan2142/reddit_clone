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

  Future<Either<ResponseFailure, T>> getAsSingle<T>({
    required String path,
    required T Function(Map<String, dynamic> json) converter,
    String? rootKey,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await client.get(
        path,
        queryParameters: queryParameters,
      );

      Map<String, dynamic> dataMap;

      var data = response.data;

      if (rootKey != null) {
        dataMap = data[rootKey];
      } else {
        dataMap = data;
      }

      final model = converter(dataMap);

      return Right(model);
    } catch (e) {
      return Left(ResponseFailure.unknown());
    }
  }

  Future<Either<ResponseFailure, List<T>>> getAsList<T>({
    required String path,
    required T Function(Map<String, dynamic> json) converter,
    String? rootKey,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await client.get(
        path,
        queryParameters: queryParameters,
      );

      List dataList;

      var data = response.data;

      if (rootKey != null) {
        dataList = data[rootKey];
      } else {
        dataList = data;
      }

      final listOfT = dataList.map((e) => converter(e)).toList();

      return Right(listOfT);
    } catch (e) {
      return Left(ResponseFailure.unknown());
    }
  }
}
