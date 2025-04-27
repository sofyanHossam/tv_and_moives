import 'package:dartz/dartz.dart';
import 'package:movie_and_tv_show/domain/moive/repositories/movie.dart';
import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';


class GetNowPlayingMoviesUseCase extends UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }

}