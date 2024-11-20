import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/model/home/genre_model.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';
import 'package:movie_app/features/home/domain/use_case/genre_list_usecase.dart';

class GenreCubit extends Cubit<GenreState> {
  final GenreListUseCase _genreListUseCase;
  GenreCubit(GenreListUseCase genereCubit)
      : _genreListUseCase = genereCubit,
        super(GenreInitialState()) {
    fetchGenre();
  }

  fetchGenre() async {
    emit(GenreLoadingState());

    final response = await _genreListUseCase.execute(params: BaseMovieParams());

    response.fold((l) => emit(GenreErrorState(l.getFriendlyMessage())), (r) {
      if (r.genres.isNotEmpty) {
        emit(GenreDataState(r));
      }
    });
  }
}

class GenreState extends Equatable {
  @override
  List<Object?> get props => [];

  const GenreState();
}

class GenreInitialState extends GenreState {}

class GenreLoadingState extends GenreState {}

class GenreErrorState extends GenreState {
  final String errorMessage;

  const GenreErrorState(this.errorMessage);
}

class GenreDataState extends GenreState {
  final GenreListModel genreListModel;

  const GenreDataState(this.genreListModel);
}
