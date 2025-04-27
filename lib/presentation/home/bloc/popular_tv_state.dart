part of 'popular_tv_cubit.dart';

@immutable
abstract class PopularTvState {}

class PopularTvInitial extends PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<TVEntity> tv;

  PopularTvLoaded({required this.tv});
}

class PopularTvFailure extends PopularTvState {
  final String errorMessage;

  PopularTvFailure({required this.errorMessage});
}
