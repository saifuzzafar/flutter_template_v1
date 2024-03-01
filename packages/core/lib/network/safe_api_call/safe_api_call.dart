import 'package:core/errors/network_error.dart';
import 'package:core/network/safe_api_call/get_error.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      // debugPrint("original response $originalResponse");
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    // print('error is ${throwable.toString()}');

    if (throwable is DioException) {
      final DioException error = throwable;
      String? message;

      if (error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        // Timeout occurred
        return Left(NetworkError(
            httpError: 408,
            message: "Request Timeout",
            description: "The request to the server timed out",
            cause: error));
      } else if (error.type == DioExceptionType.badResponse) {
        return Left(NetworkError(
            httpError: 405, message: "Bad Response", cause: error));
      } else if (error.response != null && error.response?.data != null) {
        if (throwable.response!.statusCode! > 400) {
          return Left(NetworkError(
              httpError: throwable.response!.statusCode!,
              message: "Server Connection Issue!",
              description: "Server Connection Issue!",
              cause: Exception("Server Connection Issue!")));
        }
      } else if (error.response != null && error.response?.data != null) {
        if (error.response!.data['message'] is List) {
          final List list = error.response!.data['message'];
          message = list.first.toString();
        } else {
          message = error.response!.data['message'].toString();
        }
        if (message.isNotEmpty && 'null' != message) {
          return Left(
            NetworkError(
                message: message,
                httpError: error.response?.statusCode ?? "400",
                cause: throwable),
          );
        } else {
          String? err = error.response?.data['error'];
          return Left(
            NetworkError(
                message: err ?? 'Something went wrong',
                httpError: error.response?.statusCode ?? 400,
                cause: throwable),
          );
        }
      }

      String? err = error.response?.statusMessage;

      return Left(
        NetworkError(
            message: err ?? 'Something went wrong',
            httpError: error.response?.statusCode ?? 400,
            cause: throwable),
      );
    } else {
      return Left(
        NetworkError(
            message: "Something went wrong, Server connection failed.",
            httpError: 503,
            cause: throwable),
      );
    }
  }
}

extension RetrofitResponse on HttpResponse {
  /// Returns true if the code is in [200..300), which means the request was successfully received,
  /// understood, and accepted.
  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 500;
  }
}
