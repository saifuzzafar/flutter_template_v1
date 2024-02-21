import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'home_api_service.g.dart';

/// This class [HomeApiService] is responsible
/// to include api calls related to the home feature
/// @RestApi is annotation which generate a g.dart file which contain implementation
/// of all abstract methods
@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;
}
