import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_and_tv_show/common/helper/navigation/AppNavigatior.dart';
import 'package:movie_and_tv_show/core/configs/assets/app_images.dart';
import 'package:movie_and_tv_show/presentation/auth/pages/signin.dart';
import 'package:movie_and_tv_show/presentation/home/pages/home.dart';
import 'package:movie_and_tv_show/presentation/splash/bloc/splash_cubit.dart';

class SplashPage extends StatelessWidget{
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocListener<SplashCubit,SplashState>(
        listener: (BuildContext context, SplashState state) {
          if(state is UnAuthenticated){
            AppNavigator.pushReplacement(context,  SigninPage());
          }
          if(state is Authenticated){
            AppNavigator.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.splashBackground))
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff1A1B20).withOpacity(0),
                      const Color(0xff1A1B20)
                    ])
              ),

            )
          ],
        ),
      ),
    );
  }
}