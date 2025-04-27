part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class DisplaySplash extends SplashState {}
class Authenticated extends SplashState {}
class UnAuthenticated extends SplashState {}

