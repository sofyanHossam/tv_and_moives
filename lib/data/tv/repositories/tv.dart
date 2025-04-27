import 'package:dartz/dartz.dart';
import 'package:movie_and_tv_show/data/tv/models/tv.dart';
import 'package:movie_and_tv_show/data/tv/resources/tv_survice.dart';

import '../../../common/helper/mapper/keyword_mapper.dart';
import '../../../common/helper/mapper/tv_mapper.dart';
import '../../../core/models/keyword.dart';
import '../../../domain/tv/repositories/tv.dart';
import '../../../service_locator.dart';

class TvRepositoryImpl extends TvRepository{
  @override
  Future<Either> getPopularTv()  async{
    var returnedData = await sl<TvService>().getPopularTv();

    return returnedData.fold(
            (error){
          return Left(error);
        },
            (data){
          var movies = List.from(data['content']).map((item) =>
              TvMapper.toEntity(TVModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }

  @override
  Future<Either> getRecommendationTv(int tvId) async {
    var returnedData = await sl < TvService > ().getRecommendationTv(tvId);
    return returnedData.fold(
            (error) {
          return Left(error);
        },
            (data) {
          var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }
  @override
  Future<Either> getSimilarTv(int tvId) async {
    var returnedData = await sl <TvService> ().getSimilarTv(tvId);
    return returnedData.fold(
            (error) {
          return Left(error);
        },
            (data) {
          var movies = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl < TvService > ().getKeywords(tvId);
    return returnedData.fold(
            (error) {
          return Left(error);
        },
            (data) {
          var movies = List.from(data['content']).map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }

  @override
  Future<Either> searchTv(String query) async{
    var returnedData = await sl<TvService>().searchTv(query);

    return returnedData.fold(
            (error){
          return Left(error);
        },
            (data){
          var tv = List.from(data['content']).map((item) =>
              TvMapper.toEntity(TVModel.fromJson(item))).toList();
          return Right(tv);
        }
    );
  }
}