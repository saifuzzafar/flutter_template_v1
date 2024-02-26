import 'package:core/core/base_usecase/base_usecase.dart';
import 'package:core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/domain/model/home/up_coming_model.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

class UpComingMoviesUseCase
    extends BaseUseCase<BaseError, BaseMovieParams, UpComingMoviesModel> {
  final HomeRepository _homeRepository;

  UpComingMoviesUseCase(this._homeRepository);

  @override
  Future<Either<BaseError, UpComingMoviesModel>> execute(
      {required BaseMovieParams params}) {
    return _homeRepository.getUpComingMovies(params);
  }
}
