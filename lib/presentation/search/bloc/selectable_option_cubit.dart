import 'package:bloc/bloc.dart';


class SelectableOptionCubit extends Cubit<SearchType> {
  SelectableOptionCubit() : super(SearchType.movie);

  void selectMovie () => emit(SearchType.movie);
  void selectTv () => emit(SearchType.tv);
}

enum SearchType{movie,tv}
