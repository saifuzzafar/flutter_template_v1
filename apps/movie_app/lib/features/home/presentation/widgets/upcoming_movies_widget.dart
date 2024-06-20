import 'package:core_flutter/common_widgets/app_error_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/di/home_providers.dart';
import 'package:movie_app/features/home/domain/model/home/movie_item.dart';
import 'package:movie_app/features/home/presentation/cubit/up_coming_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/content_scroll.dart';
import 'package:movie_app/generated/l10n.dart';

class UpcomingMoviesView extends StatefulWidget {
  const UpcomingMoviesView({super.key});

  @override
  State<UpcomingMoviesView> createState() => _UpcomingMoviesViewState();
}

class _UpcomingMoviesViewState extends State<UpcomingMoviesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
      bloc: upcomingMoviesCubit,
      builder: (context, state) {
        if (state is UpcomingMoviesDataState) {
          return _buildUpcomingMoviesList(state: state, context: context);
        } else if (state is UpcomingMoviesErrorState) {
          return Center(
            child: AppErrorPopup(
              errorMessage: state.errorMessage,
            ),
          );
        } else if (state is UpcomingMoviesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  _buildUpcomingMoviesList(
      {required UpcomingMoviesDataState state, required BuildContext context}) {
    final List<MovieItem> moviesList = [];
    state.upComingMoviesModel.results
        ?.map((e) => moviesList.add(MovieItem(
            id: e.id ?? 0, title: e.title ?? '', imageUrl: e.posterPath ?? '')))
        .toList();

    return ContentScroll(
      scrollObject: moviesList,
      title: SMovie.current.upComing,
    );
  }
}
