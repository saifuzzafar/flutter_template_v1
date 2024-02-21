import 'package:core/errors/base_error.dart';
import 'package:movie_app/features/home/domain/model/home/home_model.dart';
import 'package:core/core/base_usecase/params.dart';
import 'package:core/core/base_usecase/base_usecase.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/model/home/home_param.dart';
import 'package:fpdart/fpdart.dart';

/// This class [HomeUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class HomeUseCase extends BaseUseCase<BaseError, HomeParams, HomeModel> {
    final HomeRepository _homeRepository;

    HomeUseCase(this._homeRepository);

    @override
    Future<Either<BaseError, HomeModel>> execute({required HomeParams params}) {
      // TODO: implement execute
      throw UnimplementedError();
    }
}

class HomeParams extends Params {
  final HomeParam homeParam;

  HomeParams(this.homeParam);
}
