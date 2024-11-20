import 'package:core/errors/database_error.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';

// ignore_for_file: constant_identifier_names
Future<Either<DatabaseError, T>> safeDbCall<T>(Future<T> dbCall) async {
  try {
    final originalResponse = await dbCall;
    return Right(originalResponse);
  } catch (exception) {
    switch (exception.runtimeType) {
      case AppLocalExceptionType:
        if (exception is AppLocalExceptionType) {
          switch (exception) {
            case AppLocalExceptionType.noUserFound:
              return Left(
                DatabaseError(
                  message: exception.toString(),
                  databaseError: exception.value,
                  // Should be error as per the case
                  cause: Exception(exception.toString()),
                ),
              );
            default:
              return Left(
                DatabaseError(
                  message: exception.toString(),
                  databaseError: 0, // Should be error as per the case
                  cause: Exception("Database Error"),
                ),
              );
          }
        } else {
          return Left(
            DatabaseError(
              message: exception.toString(),
              databaseError: 0, // Should be error as per the case
              cause: Exception("Database Error"),
            ),
          );
        }
      case UnsupportedError:
      case MissingPluginException:
        return Left(
          DatabaseError(
            message: exception.toString(),
            databaseError: 1, // Should be error as per the case
            cause: Exception(exception.toString()),
          ),
        );

      default:
        return Left(
          DatabaseError(
            message: exception.toString(),
            databaseError: 0, // Should be error as per the case
            cause: Exception("Database Error"),
          ),
        );
    }
  }
}

class AppLocalExceptionType {
  final int _value;

  const AppLocalExceptionType._(this._value);

  int get value => _value;

  static const AppLocalExceptionType noUserFound = AppLocalExceptionType._(2);
}
