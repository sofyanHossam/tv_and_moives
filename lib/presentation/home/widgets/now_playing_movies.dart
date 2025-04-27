import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_and_tv_show/common/cubit/genertic_data_cubit.dart';
import 'package:movie_and_tv_show/domain/moive/entity/movie.dart';
import 'package:movie_and_tv_show/domain/moive/usecases/get_now_playing_movies.dart';
import '../../../common/Widgets/movie_card.dart';
import '../../../service_locator.dart';

class NowPlayingMovies extends StatelessWidget{
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context) => GenericDataCubit()..getData<List<MovieEntity>>(sl<GetNowPlayingMoviesUseCase>()) ,
      child: BlocBuilder<GenericDataCubit,GenericDataState>(
          builder: (context,state){
            if(state is DataLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is DataLoaded){
              return SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context,index) {
                    return MovieCard(
                      movieEntity: state.data[index],
                    );
                  },
                  separatorBuilder: (context,index) => const SizedBox(width: 10,),
                  itemCount: state.data.length,
                ),
              );
            }

            if (state is FailureLoadData) {
              return Center(child: Text(state.errorMessage));
            }
            return Container();
          }
      ),
    );
  }


}