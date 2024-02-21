import 'package:movie_app/features/home/data/api_service/home_api_service.dart';
import 'package:movie_app/features/home/data/api_service/home_api_service.dart';

/// This class [HomeRemoteDataSource] is used to fetch Api from network
/// using [HomeApiService] class.
class HomeRemoteDataSource {
  final HomeApiService _homeApiService;

  HomeRemoteDataSource(this._homeApiService);

}
