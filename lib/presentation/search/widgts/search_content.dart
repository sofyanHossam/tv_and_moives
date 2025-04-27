import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_and_tv_show/common/Widgets/movie_card.dart';
import 'package:movie_and_tv_show/common/Widgets/tv_card.dart';
import 'package:movie_and_tv_show/presentation/search/bloc/search_cubit.dart';

class SearchContent extends StatelessWidget{
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<SearchCubit,SearchState>(
     builder: (context,state){
       if(state is SearchLoading){
         return const Center(child: CircularProgressIndicator());
       }
       if (state is MoviesLoaded){

         return GridView.builder(
           shrinkWrap: true,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
           crossAxisSpacing: 10,
             mainAxisSpacing: 10,
             childAspectRatio: 0.6,
           ),

           itemBuilder: (context,index){
             return MovieCard(movieEntity: state.movies[index]);
           },
           itemCount: state.movies.length,
         );
       }
       if (state is TVsLoaded){
         return GridView.builder(
           shrinkWrap: true,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             crossAxisSpacing: 10,
             mainAxisSpacing: 10,
             childAspectRatio: 0.6,
           ),

           itemBuilder: (context,index){
             return TVCard(tvEntity: state.tvs[index]);
           },
           itemCount: state.tvs.length,
         );
       }
       if(state is SearchFailure){
         return Center(child: Text(state.errorMessage));
       }

       return Container();
     }
   );
  }

}