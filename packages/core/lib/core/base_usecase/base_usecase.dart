import 'package:core/core/base_usecase/params.dart';
import 'package:core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<Either<E, T>> execute({required P params});
}
