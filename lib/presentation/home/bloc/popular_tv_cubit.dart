import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_and_tv_show/domain/tv/entities/tv.dart';
import 'package:movie_and_tv_show/domain/tv/usecases/get_popular_tv.dart';

import '../../../service_locator.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvLoading());
  void getPopularTv() async {
    var returnedData = await sl<GetPopularTvUseCase>().call();
    returnedData.fold((error) {
      emit(PopularTvFailure(errorMessage: error));
    }, (data) {
      emit(PopularTvLoaded(tv: data));
    });
  }

}


