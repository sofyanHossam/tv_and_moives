import 'package:dartz/dartz.dart';
import 'package:movie_and_tv_show/domain/tv/repositories/tv.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class GetPopularTvUseCase extends UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async {
    return await sl<TvRepository>().getPopularTv();
  }

}