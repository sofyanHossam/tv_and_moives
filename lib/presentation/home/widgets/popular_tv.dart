import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_and_tv_show/common/cubit/genertic_data_cubit.dart';
import 'package:movie_and_tv_show/domain/tv/entities/tv.dart';
import 'package:movie_and_tv_show/domain/tv/usecases/get_popular_tv.dart';
import '../../../common/Widgets/tv_card.dart';
import '../../../service_locator.dart';


class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataCubit()..getData<List<TVEntity>>(sl<GetPopularTvUseCase>()),
        child: BlocBuilder<GenericDataCubit,GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading){
              return const Center(
                  child: CircularProgressIndicator()
              );
            }

            if (state is DataLoaded ){
              return SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return TVCard(
                        tvEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: state.data.length
                ),
              );
            }

            if (state is FailureLoadData) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        )
    );
  }
}