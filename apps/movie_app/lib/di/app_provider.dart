import 'package:core/network/interceptor/dio_base_option.dart';
import 'package:core/network/interceptor/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/main/flavor.dart';

class AppProviders {
  static late Dio appDio;

  init(Flavor flavor) async {
    // Register Dio
    appDio = DioHelper.createDio(
      DioBaseOption(baseUrl: flavor.baseUrl),
    );
  }
}
