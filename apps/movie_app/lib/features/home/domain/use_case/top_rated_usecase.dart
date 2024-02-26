import 'package:core/core/base_usecase/base_usecase.dart';
import 'package:core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/domain/model/home/top_rated_model.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

class TopRatedMoviesUseCase
    extends BaseUseCase<BaseError, BaseMovieParams, TopRatedMoviesModel> {
  final HomeRepository _homeRepository;

  TopRatedMoviesUseCase(this._homeRepository);

  @override
  Future<Either<BaseError, TopRatedMoviesModel>> execute(
      {required BaseMovieParams params}) {
    return _homeRepository.getTopRatedMovies(params);
  }
}
