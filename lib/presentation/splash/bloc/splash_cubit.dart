import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_and_tv_show/domain/auth/usecases/is_logged_in.dart';

import '../../../service_locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted()async{
    // back later
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if(isLoggedIn){
      emit(Authenticated());
    }else{
      emit(UnAuthenticated());
    }

  }
}
