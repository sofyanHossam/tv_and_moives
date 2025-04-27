
import 'package:get_it/get_it.dart';
import 'package:movie_and_tv_show/data/auth/repositories/auth.dart';
import 'package:movie_and_tv_show/data/auth/sources/auth_service.dart';
import 'package:movie_and_tv_show/data/movie/repositories/movie.dart';
import 'package:movie_and_tv_show/data/movie/resources/movie.dart';
import 'package:movie_and_tv_show/data/tv/repositories/tv.dart';
import 'package:movie_and_tv_show/data/tv/resources/tv_survice.dart';
import 'package:movie_and_tv_show/domain/auth/repositories/auth.dart';
import 'package:movie_and_tv_show/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_and_tv_show/domain/auth/usecases/signup.dart';
import 'package:movie_and_tv_show/domain/moive/repositories/movie.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/get_movie_trailer.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/get_now_playing_movies.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/get_recommendation_movie.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/get_similar_movies.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/get_trending_movies.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/search_movie.dart';
import 'package:movie_and_tv_show/domain/tv/repositories/tv.dart';
import 'package:movie_and_tv_show/domain/tv/usecases/get_keyword.dart';
import 'package:movie_and_tv_show/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_and_tv_show/domain/tv/usecases/get_recommendation_tv.dart';
import 'package:movie_and_tv_show/domain/tv/usecases/search_tv.dart';

import 'core/network/dio_client.dart';
import 'domain/auth/usecases/signin.dart';
import 'domain/tv/usecases/get_similar_tv.dart';


final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());

  // services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TvService>(TvServiceImpl());


  // useCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  sl.registerSingleton<GetSimilarTvsUseCase>(GetSimilarTvsUseCase());
  sl.registerSingleton<GetRecommendationTvsUseCase>(GetRecommendationTvsUseCase());
  sl.registerSingleton<GetTVKeywordsUseCase>(GetTVKeywordsUseCase());
  sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase());
  sl.registerSingleton<SearchTvsUseCase>(SearchTvsUseCase());


  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());


}