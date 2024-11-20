import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/model/home/up_coming_model.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';
import 'package:movie_app/features/home/domain/use_case/up_coming_movies_usecase.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  final UpComingMoviesUseCase _upComingMoviesUseCase;
  UpcomingMoviesCubit(UpComingMoviesUseCase upComingMoviesUseCase)
      : _upComingMoviesUseCase = upComingMoviesUseCase,
        super(UpcomingMoviesInitialState()) {
    fetchUpcomingMovies();
  }

  fetchUpcomingMovies() async {
    emit(UpcomingMoviesLoadingState());

    final response =
        await _upComingMoviesUseCase.execute(params: BaseMovieParams());

    response.fold(
        (l) => emit(UpcomingMoviesErrorState(
              errorMessage: l.getFriendlyMessage(),
            )), (r) {
      if (r.results != null && r.results!.isNotEmpty) {
        emit(UpcomingMoviesDataState(r));
      }
    });
  }
}

class UpcomingMoviesState extends Equatable {
  @override
  List<Object?> get props => [];

  const UpcomingMoviesState();
}

class UpcomingMoviesInitialState extends UpcomingMoviesState {}

class UpcomingMoviesLoadingState extends UpcomingMoviesState {}

class UpcomingMoviesErrorState extends UpcomingMoviesState {
  final String errorMessage;

  const UpcomingMoviesErrorState({required this.errorMessage});
}

class UpcomingMoviesDataState extends UpcomingMoviesState {
  final UpComingMoviesModel upComingMoviesModel;

  const UpcomingMoviesDataState(this.upComingMoviesModel);
}
