import 'package:core/core/base_usecase/base_usecase.dart';
import 'package:core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/domain/model/home/home_model.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

/// This class [HomeUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class HomeUseCase extends BaseUseCase<BaseError, BaseMovieParams, HomeModel> {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  @override
  Future<Either<BaseError, HomeModel>> execute(
      {required BaseMovieParams params}) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
