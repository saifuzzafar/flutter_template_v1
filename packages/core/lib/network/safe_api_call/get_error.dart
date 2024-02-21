import 'package:core/errors/network_error.dart';
import 'package:dio/dio.dart';

NetworkError getError({required Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      return NetworkError(
          httpError: apiResponse.statusCode!,
          cause: Exception("Server Response Error"),
          message: apiResponse.statusMessage!);
    } catch (exception) {
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
