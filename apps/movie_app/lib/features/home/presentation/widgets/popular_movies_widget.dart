import 'package:core_flutter/common_widgets/app_error_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/generated/l10n.dart';
import 'package:movie_app/features/home/domain/model/home/movie_item.dart';
import 'package:movie_app/features/home/presentation/cubit/popular_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/content_scroll.dart';

class PopularMoviesView extends StatefulWidget {
  const PopularMoviesView({super.key});

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesDataState) {
          return _buildPopularMoviesList(state: state, context: context);
        } else if (state is PopularMoviesErrorState) {
          return Center(
            child: AppErrorPopup(
              errorMessage: state.errorMessage,
            ),
          );
        } else if (state is PopularMoviesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  _buildPopularMoviesList(
      {required PopularMoviesDataState state, required BuildContext context}) {
    final List<MovieItem> moviesList = [];
    state.popularMoviesModel.results
        ?.map((e) => moviesList.add(MovieItem(
            id: e.id ?? 0, title: e.title ?? '', imageUrl: e.posterPath ?? '')))
        .toList();

    return ContentScroll(
      scrollObject: moviesList,
      title: S.of(context).popular,
    );
  }
}
