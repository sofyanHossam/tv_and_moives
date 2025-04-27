import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_and_tv_show/domain/moive/entity/movie.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/get_trending_movies.dart';
import '../../../service_locator.dart';
part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold((error) {
      emit(TrendingMoviesFailure(errorMessage: error));
    }, (data) {
      emit(TrendingMoviesLoaded(movies: data));
    });
  }
}
