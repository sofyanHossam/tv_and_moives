import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_and_tv_show/common/Widgets/BasicAppbar.dart';
import 'package:movie_and_tv_show/core/configs/assets/app_vectors.dart';
import 'package:movie_and_tv_show/presentation/home/widgets/category_text.dart';
import 'package:movie_and_tv_show/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_and_tv_show/presentation/home/widgets/popular_tv.dart';
import 'package:movie_and_tv_show/presentation/home/widgets/trending_movies.dart';
import 'package:movie_and_tv_show/presentation/search/pages/search.dart';

import '../../../common/helper/navigation/AppNavigatior.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo),
        action: IconButton(
            onPressed: () {
              AppNavigator.push(context, const SearchPage());
              // here navigate to search page
            },
            icon: const Icon(Icons.search)
        ),
      ),
      body:
      const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: "Trending"),
            TrendingMovies(),
            SizedBox(height: 16,),
            CategoryText(title: "Now Playing"),
            SizedBox(height: 16,),
            NowPlayingMovies(),
            SizedBox(height: 16,),
            CategoryText(title: "Tv Shows"),
            SizedBox(height: 16,),
            PopularTv()

          ],
        ),
      ),
    );
  }
}
