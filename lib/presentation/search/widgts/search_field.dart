import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_and_tv_show/presentation/search/bloc/search_cubit.dart';
import 'package:movie_and_tv_show/presentation/search/bloc/selectable_option_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().textEditingController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          context
              .read<SearchCubit>()
              .search(value, context.read<SelectableOptionCubit>().state);
        }
      },
      decoration: const InputDecoration(hintText: "Search..."),
    );
  }
}
