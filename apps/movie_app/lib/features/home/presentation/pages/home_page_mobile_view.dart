import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/widgets/movies_category_view.dart';
import 'package:movie_app/features/home/presentation/widgets/now_playing_movies_view.dart';
import 'package:movie_app/features/home/presentation/widgets/popular_movies_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/top_rated_movies_view.dart';
import 'package:movie_app/features/home/presentation/widgets/upcoming_movies_widget.dart';

/// This class [HomePageMobileView] which specifically used to render Mobile UI
class HomePageMobileView extends StatelessWidget {
  final double viewPort;
  const HomePageMobileView({super.key, this.viewPort = 0.8});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NowPlayingMoviesView(
          viewPort: viewPort,
        ),
        const SizedBox(
          height: 10,
        ),
        const MovieGenreView(),
        const SizedBox(
          height: 10,
        ),
        const TopRatedMoviesView(),
        const SizedBox(
          height: 10,
        ),
        const PopularMoviesView(),
        const SizedBox(
          height: 10,
        ),
        const UpcomingMoviesView()
      ],
    );
  }
}
