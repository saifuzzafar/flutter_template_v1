import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/model/home/popular_movies_model.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';
import 'package:movie_app/features/home/domain/use_case/popular_movies_usecase.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final PopularMoviesUseCase _popularMoviesUseCase;

  PopularMoviesCubit(PopularMoviesUseCase popularMoviesUseCase)
      : _popularMoviesUseCase = popularMoviesUseCase,
        super(PopularMoviesInitialState());

  fetchPopularMovies() async {
    emit(PopularMoviesLoadingState());

    final response =
        await _popularMoviesUseCase.execute(params: BaseMovieParams());

    response.fold((l) => emit(PopularMoviesErrorState(l.getFriendlyMessage())),
        (r) {
      if (r.results != null && r.results!.isNotEmpty) {
        emit(PopularMoviesDataState(r));
      }
    });
  }
}

class PopularMoviesState extends Equatable {
  @override
  List<Object?> get props => [];

  const PopularMoviesState();
}

class PopularMoviesInitialState extends PopularMoviesState {}

class PopularMoviesLoadingState extends PopularMoviesState {}

class PopularMoviesErrorState extends PopularMoviesState {
  final String errorMessage;
  const PopularMoviesErrorState(this.errorMessage);
}

class PopularMoviesDataState extends PopularMoviesState {
  final PopularMoviesModel popularMoviesModel;

  const PopularMoviesDataState(this.popularMoviesModel);
}
