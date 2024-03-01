import 'package:core/network/dio_provider.dart';
import 'package:core/network/interceptor/dio_base_option.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/main/flavor.dart';

final getIt = GetIt.instance;

class AppProviders {
  init(Flavor flavor) async {
    // Register Dio
    getIt.registerSingleton<Dio>(
      DioProvider.createDio(
        DioBaseOption(baseUrl: flavor.baseUrl),
      ),
    );
  }
}
