import 'package:core_flutter/common_widgets/app_error_popup.dart';
import 'package:core_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/di/home_providers.dart';
import 'package:movie_app/features/home/domain/model/home/movie_Item.dart';
import 'package:movie_app/features/home/presentation/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/content_scroll.dart';

class TopRatedMoviesView extends StatefulWidget {
  const TopRatedMoviesView({super.key});

  @override
  State<TopRatedMoviesView> createState() => _TopRatedMoviesViewState();
}

class _TopRatedMoviesViewState extends State<TopRatedMoviesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      bloc: topRatedMoviesCubit,
      builder: (context, state) {
        if (state is TopRatedMoviesDataState) {
          return _buildTopRatedMoviesList(state: state, context: context);
        } else if (state is TopRatedMoviesErrorState) {
          return Center(
            child: AppErrorPopup(
              errorMessage: state.errorMessage,
            ),
          );
        } else if (state is TopRatedMoviesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  _buildTopRatedMoviesList(
      {required TopRatedMoviesDataState state, required BuildContext context}) {
    final List<MovieItem> moviesList = [];
    state.topRatedMoviesModel.results
        ?.map((e) => moviesList.add(MovieItem(
            id: e.id ?? 0, title: e.title ?? '', imageUrl: e.posterPath ?? '')))
        .toList();

    return ContentScroll(
      scrollObject: moviesList,
      title: S.of(context).topRated,
    );
  }
}
