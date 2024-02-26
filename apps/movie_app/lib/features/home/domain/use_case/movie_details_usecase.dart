import 'package:core/core/base_usecase/base_usecase.dart';
import 'package:core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/domain/model/home/movie_details_model.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

class MovieDetailsUseCase
    extends BaseUseCase<BaseError, BaseMovieParams, MovieDetailsModel> {
  final HomeRepository _homeRepository;

  MovieDetailsUseCase(this._homeRepository);

  @override
  Future<Either<BaseError, MovieDetailsModel>> execute(
      {required BaseMovieParams params}) {
    return _homeRepository.getMovieDetails(params);
  }
}
