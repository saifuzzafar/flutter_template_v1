import 'package:core/network/dio_provider.dart';
import 'package:core/network/interceptor/dio_base_option.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/main/flavor.dart';

class AppProviders {
  static late Dio appDio;

  init(Flavor flavor) async {
    // Register Dio
    appDio = DioProvider.createDio(
      DioBaseOption(baseUrl: flavor.baseUrl),
    );
  }
}
