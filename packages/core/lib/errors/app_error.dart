import 'package:core/constants/error_types.dart';
import 'package:core/errors/error_info.dart';

class AppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception cause;

  AppError({
    Exception? cause,
    required this.error,
    ErrorType? type,
  })  : cause = cause ?? Exception(),
        type = type ?? ErrorType.textFieldValidation;
}
