import 'package:dartz/dartz.dart';
import 'package:movie_and_tv_show/domain/moive/repositories/movie.dart';
import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';


class SearchMovieUseCase extends UseCase<Either,String> {

  @override
  Future<Either> call({String ? params}) async {
    return await sl<MovieRepository>().searchMovie(params!);
  }

}