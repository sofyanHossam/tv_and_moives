part of 'trailer_cubit.dart';

@immutable
abstract class TrailerState {}


class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;
  TrailerLoaded({required this.youtubePlayerController});
}

class FailuerLoadTrailer extends TrailerState {
  final String errorMessage;
  FailuerLoadTrailer({required this.errorMessage});
}

