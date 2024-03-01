import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/widgets/movies_category_view.dart';
import 'package:movie_app/features/home/presentation/widgets/now_playing_movies_view.dart';
import 'package:movie_app/features/home/presentation/widgets/popular_movies_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/top_rated_movies_view.dart';
import 'package:movie_app/features/home/presentation/widgets/upcoming_movies_widget.dart';

/// This class [HomePageMobileView] which specifically used to render Mobile UI
class HomePageMobileView extends StatelessWidget {
  const HomePageMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NowPlayingMoviesView(),
        SizedBox(
          height: 10,
        ),
        MovieGenreView(),
        SizedBox(
          height: 10,
        ),
        TopRatedMoviesView(),
        SizedBox(
          height: 10,
        ),
        PopularMoviesView(),
        SizedBox(
          height: 10,
        ),
        UpcomingMoviesView()
      ],
    );
  }
}
