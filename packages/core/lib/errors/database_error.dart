import 'package:core/constants/error_types.dart';
import 'package:core/errors/app_error.dart';
import 'package:core/errors/error_info.dart';

import 'base_error.dart';

class DatabaseError extends BaseError {
  DatabaseError({
    required String message,
    required int databaseError,
    required super.cause,
  }) : super(error: ErrorInfo(message: message, code: databaseError));

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 1:
        return AppError(
            error: error, cause: cause, type: ErrorType.databaseNotSupported);
      case 2:
        return AppError(
            error: error, cause: cause, type: ErrorType.dbUserNotFound);
      case 101:
        return AppError(
            error: error, cause: cause, type: ErrorType.userPresentInDb);
      case 102:
        return AppError(
            error: error, cause: cause, type: ErrorType.userNotFound);
      case 103:
        return AppError(
            error: error, cause: cause, type: ErrorType.emailNotFound);
      case 104:
        return AppError(
            error: error, cause: cause, type: ErrorType.errorNewPassword);
      case 105:
        return AppError(error: error, cause: cause, type: ErrorType.errorPin);
      case 106:
        return AppError(
            error: error, cause: cause, type: ErrorType.errorPinSignIn);
      default:
        return AppError(error: error, cause: cause, type: ErrorType.database);
    }
  }
}
