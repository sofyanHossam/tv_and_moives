import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class TvService{
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTv(int tvId);
  Future<Either> getSimilarTv(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTv(String query);
}

class TvServiceImpl extends TvService {
  @override
  Future<Either> getPopularTv() async {
    try {

      var response = await sl<DioClient>().get(
        ApiUrl.popularTV,
      );
      return Right(response.data);
    }on DioException catch(e){
      return left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTv(int tvId)async {
    try {

      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/recommendations',
      );
      return Right(response.data);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    try {

      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/similar',
      );
      return Right(response.data);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  @override
  Future<Either> getKeywords(int tvId) async {
    try {

      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/keywords',
      );
      return Right(response.data);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> searchTv(String query) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.search}tv/$query',
      );
      return Right(response.data);
    }on DioException catch(e){
      return left(e.response!.data['message']);
    }
  }

}