
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repositories/tv.dart';

class GetSimilarTvsUseCase extends UseCase<Either,int> {

  @override
  Future<Either> call({int ? params}) async {
    return await sl<TvRepository>().getSimilarTv(params!);
  }

}
