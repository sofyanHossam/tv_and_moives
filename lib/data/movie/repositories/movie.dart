import 'package:dartz/dartz.dart';
import 'package:movie_and_tv_show/common/helper/mapper/movie_mapper.dart';
import 'package:movie_and_tv_show/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_and_tv_show/core/models/trailer.dart';
import 'package:movie_and_tv_show/data/movie/models/movie.dart';
import 'package:movie_and_tv_show/data/movie/resources/movie.dart';
import 'package:movie_and_tv_show/domain/moive/repositories/movie.dart';

import '../../../service_locator.dart';

class MovieRepositoryImpl extends MovieRepository{
  @override
  Future<Either> getTrendingMovies() async{
    var returnedData = await sl<MovieService>().getTrendingMovies();
    
    return returnedData.fold(
            (error){
              return Left(error);
            },
            (data){
              var movies = List.from(data['content']).map((item) =>
                  MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
              return Right(movies);
            }
            );
  }

  @override
  Future<Either> getNowPlayingMovies()  async{
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold(
            (error){
          return Left(error);
        },
            (data){
          var movies = List.from(data['content']).map((item) =>
              MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }
  @override
  Future<Either> getRecommendationMovies(int movieId)  async{
    var returnedData = await sl<MovieService>().getRecommendationMovies(movieId);

    return returnedData.fold(
            (error){
          return Left(error);
        },
            (data){
          var movies = List.from(data['content']).map((item) =>
              MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId)  async{
    var returnedData = await sl<MovieService>().getSimilarMovies(movieId);

    return returnedData.fold(
            (error){
          return Left(error);
        },
            (data){
          var movies = List.from(data['content']).map((item) =>
              MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async{
    var returnedData = await sl<MovieService>().getMovieTrailer(movieId);

    return returnedData.fold(
            (error){
          return Left(error);
        },
            (data){
          var movies = TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));

          return Right(movies);
        }
    );
  }

  @override
  Future<Either> searchMovie(String query) async{
    var returnedData = await sl<MovieService>().searchMovie(query);

    return returnedData.fold(
            (error){
          return Left(error);
        },
            (data){
          var movies = List.from(data['content']).map((item) =>
              MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
          return Right(movies);
        }
    );
  }
}