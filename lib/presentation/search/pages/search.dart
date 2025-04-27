import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_and_tv_show/common/Widgets/BasicAppbar.dart';
import 'package:movie_and_tv_show/presentation/search/bloc/search_cubit.dart';
import 'package:movie_and_tv_show/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_and_tv_show/presentation/search/widgts/search_options.dart';

import '../widgts/search_content.dart';
import '../widgts/search_field.dart';
import '../widgts/selectable_option.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text("search"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit())
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(

              children: [
                SearchField(),
                SizedBox(height: 16,),
                SearchOptions(),
                SizedBox(height: 16,),
                Expanded(child: SearchContent())
              ]

          ),
        ),
      ),
    );
  }

}