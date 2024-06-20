import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/model/home/now_playing_model.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';
import 'package:movie_app/features/home/domain/use_case/now_playing_usecase.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  final NowPlayingUseCase _nowPlayingUseCase;
  NowPlayingMoviesCubit(NowPlayingUseCase nowPlayingUseCase)
      : _nowPlayingUseCase = nowPlayingUseCase,
        super(NowPlayingMoviesInitialState());

  fetchNowPlaying() async {
    emit(NowPlayingMoviesLoadingState());

    final response =
        await _nowPlayingUseCase.execute(params: BaseMovieParams());

    response.fold(
        (l) => emit(NowPlayingMoviesErrorState(l.getFriendlyMessage())), (r) {
      if (r.results != null && r.results!.isNotEmpty) {
        emit(NowPlayingMoviesDataState(r));
      }
    });
  }
}

class NowPlayingMoviesState extends Equatable {
  @override
  List<Object?> get props => [];

  const NowPlayingMoviesState();
}

class NowPlayingMoviesInitialState extends NowPlayingMoviesState {}

class NowPlayingMoviesLoadingState extends NowPlayingMoviesState {}

class NowPlayingMoviesErrorState extends NowPlayingMoviesState {
  final String errorMessage;
  const NowPlayingMoviesErrorState(this.errorMessage);
}

class NowPlayingMoviesDataState extends NowPlayingMoviesState {
  final NowPlayingMoviesModel nowPlayingMoviesModel;

  const NowPlayingMoviesDataState(this.nowPlayingMoviesModel);
}
