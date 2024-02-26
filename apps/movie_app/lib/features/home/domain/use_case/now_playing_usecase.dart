import 'package:core/core/base_usecase/base_usecase.dart';
import 'package:core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/domain/model/home/now_playing_model.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

class NowPlayingUseCase
    extends BaseUseCase<BaseError, BaseMovieParams, NowPlayingMoviesModel> {
  final HomeRepository _homeRepository;

  NowPlayingUseCase(this._homeRepository);

  @override
  Future<Either<BaseError, NowPlayingMoviesModel>> execute(
      {required BaseMovieParams params}) {
    return _homeRepository.getNowPlayingMovies(params);
  }
}
