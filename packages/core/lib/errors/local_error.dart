import 'package:core/constants/error_types.dart';
import 'package:core/errors/app_error.dart';
import 'package:core/errors/base_error.dart';
import 'package:core/errors/error_info.dart';

class LocalError extends BaseError {
  LocalError({
    required String message,
    required int localError,
    required super.cause,
  }) : super(error: ErrorInfo(message: message, code: localError));

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 1:
        return AppError(error: error, cause: cause, type: ErrorType.ui);
      case 2:
        return AppError(
            error: error, cause: cause, type: ErrorType.filterError);
      default:
        return AppError(
            error: error, cause: cause, type: ErrorType.ioexception);
    }
  }
}
