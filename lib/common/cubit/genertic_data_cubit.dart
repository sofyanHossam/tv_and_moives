import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/usecase/usecase.dart';

part 'genertic_data_state.dart';


class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());


  void getData<T>(UseCase usecase,{dynamic params}) async {
    var returnedData = await usecase.call(params: params);
    returnedData.fold(
            (error){
          emit(
              FailureLoadData(errorMessage: error)
          );
        },
            (data){
          emit(
              DataLoaded<T>(data: data)
          );
        }
    );
  }
}
