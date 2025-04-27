import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/search_movie.dart';
import 'package:movie_and_tv_show/domain/tv/usecases/search_tv.dart';
import 'package:movie_and_tv_show/presentation/search/bloc/selectable_option_cubit.dart';

import '../../../domain/moive/entity/movie.dart';
import '../../../domain/tv/entities/tv.dart';
import '../../../service_locator.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if(query.isNotEmpty){
      emit(SearchLoading());
      switch (searchType) {
        case SearchType.movie: searchMovie(query); break;
        case SearchType.tv:searchTv(query); break;
      }
    }

  }

  void searchMovie(String query) async {
    var returnData = await sl<SearchMovieUseCase>().call(params: query);

    returnData.fold((errorMessage) {
      emit(SearchFailure(errorMessage: errorMessage));
    }, (data) {
      emit(MoviesLoaded(movies: data));
    });
  }

  void searchTv(String query)async {
    var returnData = await sl<SearchTvsUseCase>().call(params: query);

    returnData.fold((errorMessage) {
      emit(SearchFailure(errorMessage: errorMessage));
    }, (data) {
      emit(TVsLoaded(tvs: data));
    });
  }
}
