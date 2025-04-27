import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_and_tv_show/core/configs/theme/app_theme.dart';
import 'package:movie_and_tv_show/presentation/splash/bloc/splash_cubit.dart';
import 'package:movie_and_tv_show/presentation/splash/pages/splash.dart';
import 'package:movie_and_tv_show/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        )
    );
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: SplashPage()),
    );
  }
}
