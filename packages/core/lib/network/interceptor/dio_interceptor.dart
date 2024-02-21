import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../transformer/dio_transformer.dart';
import 'dio_base_option.dart';

class DioInterceptor {
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

    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    dio.transformer = DioTransformer();

    if (dioBaseOption.proxyBaseUrl.isNotEmpty) {
      _addProxy(dio, dioBaseOption.proxyBaseUrl);
    }
    return dio;
  }

  static updateHeaders(Dio dio, Map<String, dynamic> inputHeaders) {
    dio.options = dio.options.copyWith(headers: inputHeaders);
  }

  /// Reference: https://flutterigniter.com/debugging-network-requests/
  static void _addProxy(Dio dio, String proxyUrl) {
    // Tap into the onHttpClientCreate callback
    // ignore: deprecated_member_use
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // Hook into the findProxy callback to set the client's proxy.
      client.findProxy = (url) {
        return 'PROXY $proxyUrl';
      };

      // This is a workaround to allow Charles to receive
      // SSL payloads when your app is running on Android.
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return Platform.isAndroid;
      };
      return client;
    };
  }
}
