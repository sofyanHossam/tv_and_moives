import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_and_tv_show/presentation/search/bloc/search_cubit.dart';
import 'package:movie_and_tv_show/presentation/search/widgts/selectable_option.dart';

import '../bloc/selectable_option_cubit.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
              title: "Movie",
              onTap: () => {
                context.read<SelectableOptionCubit>().selectMovie(),
                context.read<SearchCubit>().search(
                    context.read<SearchCubit>().textEditingController.text,
                    context.read<SelectableOptionCubit>().state)
              },
              isSelected: context.read<SelectableOptionCubit>().state ==
                  SearchType.movie,
            ),
            const SizedBox(
              width: 16,
            ),
            SelectableOption(
              title: "TV",
              onTap: () => {
                context.read<SelectableOptionCubit>().selectTv(),
                context.read<SearchCubit>().search(
                    context.read<SearchCubit>().textEditingController.text,
                    context.read<SelectableOptionCubit>().state)
              },
              isSelected:
                  context.read<SelectableOptionCubit>().state == SearchType.tv,
            ),
          ],
        );
      },
    );
  }
}
