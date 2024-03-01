import 'package:core/core/base_usecase/params.dart';
import 'package:core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';

/// Abstract base class for implementing use cases in a Flutter application.
///
/// Subclasses of [BaseUseCase] should define their own error type [E], parameter
/// type [P], and result type [T]. The [execute] method is responsible for executing
/// the use case logic.

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  /// Executes the use case with the provided parameters.
  ///
  /// Subclasses must implement this method to define the specific logic
  /// of the use case.
  ///
  /// The [params] parameter contains the necessary data for executing the use case.
  Future<Either<E, T>> execute({required P params});
}
