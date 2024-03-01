import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/model/home/top_rated_model.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';
import 'package:movie_app/features/home/domain/use_case/top_rated_usecase.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final TopRatedMoviesUseCase _topRatedMoviesUseCase;

  TopRatedMoviesCubit(TopRatedMoviesUseCase topRatedMoviesUseCase)
      : _topRatedMoviesUseCase = topRatedMoviesUseCase,
        super(TopRatedMoviesInitialState());

  fetchTopRated() async {
    emit(TopRatedMoviesLoadingState());

    final response =
        await _topRatedMoviesUseCase.execute(params: BaseMovieParams());

    response.fold(
        (l) => emit(TopRatedMoviesErrorState(
              errorMessage: l.getFriendlyMessage(),
            )), (r) {
      if (r.results != null && r.results!.isNotEmpty) {
        emit(TopRatedMoviesDataState(r));
      }
    });
  }
}

class TopRatedMoviesState extends Equatable {
  @override
  List<Object?> get props => [];

  const TopRatedMoviesState();
}

class TopRatedMoviesInitialState extends TopRatedMoviesState {}

class TopRatedMoviesLoadingState extends TopRatedMoviesState {}

class TopRatedMoviesErrorState extends TopRatedMoviesState {
  final String errorMessage;

  const TopRatedMoviesErrorState({required this.errorMessage});
}

class TopRatedMoviesDataState extends TopRatedMoviesState {
  final TopRatedMoviesModel topRatedMoviesModel;

  const TopRatedMoviesDataState(this.topRatedMoviesModel);
}
