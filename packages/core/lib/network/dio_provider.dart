import 'package:core/network/interceptor/api_interceptor.dart';
import 'package:dio/dio.dart';

import 'interceptor/dio_base_option.dart';
import 'transformer/dio_transformer.dart';

class DioProvider {
  static Dio createDio(DioBaseOption dioBaseOption) {
    final dio = Dio();

    // Creating options object
    final options = BaseOptions(
      baseUrl: dioBaseOption.baseUrl,
      connectTimeout: Duration(seconds: dioBaseOption.connectTimeout),
      receiveTimeout: Duration(seconds: dioBaseOption.receiveTimeOut),
      headers: dioBaseOption.headers,
    );

    dio.options = options;
    dio.interceptors.add(ApiInterceptor());

    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    dio.transformer = DioTransformer();

    return dio;
  }

  static updateHeaders(Dio dio, Map<String, dynamic> inputHeaders) {
    dio.options = dio.options.copyWith(headers: inputHeaders);
  }
}
