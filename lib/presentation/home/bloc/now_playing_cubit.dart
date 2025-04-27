import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_and_tv_show/domain/moive/entity/movie.dart';
import '../../../domain/moive/usecases/get_now_playing_movies.dart';
import '../../../service_locator.dart';
part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();
    returnedData.fold((error) {
      emit(NowPlayingMoviesFailure(errorMessage: error));
    }, (data) {
      emit(NowPlayingMoviesLoaded(movies: data));
    });
  }
}
