import 'package:core/core/base_usecase/base_usecase.dart';
import 'package:core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/domain/model/home/genre_model.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

class GenreListUseCase
    extends BaseUseCase<BaseError, BaseMovieParams, GenreListModel> {
  final HomeRepository _homeRepository;

  GenreListUseCase(this._homeRepository);

  @override
  Future<Either<BaseError, GenreListModel>> execute(
      {required BaseMovieParams params}) {
    return _homeRepository.getGenreList(params);
  }
}
